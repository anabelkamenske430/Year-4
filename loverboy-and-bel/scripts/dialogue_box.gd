extends Control

@onready var speaker_label = $PanelContainer/MarginContainer/VBoxContainer/SpeakerLabel
@onready var dialogue_label = $PanelContainer/MarginContainer/VBoxContainer/DialogueLabel
@onready var choice_container = $PanelContainer/MarginContainer/VBoxContainer/ChoiceContainer
@onready var continue_label = $PanelContainer/MarginContainer/VBoxContainer/ContinueLabel
@onready var choice_prompt_label = $PanelContainer/MarginContainer/VBoxContainer/ChoicePromptLabel

var dialogue_lines = []
var current_index = 0

var choices_active = false
var selected_choice = 0


func _ready():
	hide()
	choice_container.hide()

	DialogueManager.register_dialogue_box(self)
	choice_prompt_label.hide()

func start_dialogue(lines):
	dialogue_lines = lines
	current_index = 0

	show()
	show_current_line()

func show_current_line():
	var line = dialogue_lines[current_index]

	speaker_label.text = line["speaker"]
	dialogue_label.text = line["text"]

	if line.has("event"):

		match line["event"]:

			"sit_at_table":
				print("sit at table thrown")
				get_tree().current_scene.move_to_table()

	if line.has("choices"):
		show_choices(line["choices"])
	else:
		hide_choices()

func show_choices(choices):
	choices_active = true
	selected_choice = 0

	continue_label.hide()
	choice_prompt_label.show()
	choice_container.show()

	for child in choice_container.get_children():
		child.queue_free()

	for choice in choices:
		var choice_label = Label.new()

		choice_label.text = choice["text"]
		choice_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		choice_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		##choice_label.custom_minimum_size.y = 36

		choice_container.add_child(choice_label)

	update_choice_display()
func update_choice_display():
	var choice_labels = choice_container.get_children()

	for i in range(choice_labels.size()):
		if i == selected_choice:
			choice_labels[i].text = "> " + dialogue_lines[current_index]["choices"][i]["text"]
		else:
			choice_labels[i].text = "  " + dialogue_lines[current_index]["choices"][i]["text"]


func move_choice(direction):
	var choices = dialogue_lines[current_index]["choices"]

	selected_choice += direction

	if selected_choice < 0:
		selected_choice = choices.size() - 1

	if selected_choice >= choices.size():
		selected_choice = 0

	update_choice_display()


func select_choice():
	var choice = dialogue_lines[current_index]["choices"][selected_choice]

	print("Loverboy chose: ", choice["text"])

	choices_active = false
	hide_choices()

	var branch = choice["branch"]

	for i in range(branch.size() - 1, -1, -1):
		dialogue_lines.insert(current_index + 1, branch[i])

	dialogue_lines[current_index].erase("choices")

	advance_dialogue()


func hide_choices():
	choices_active = false
	choice_prompt_label.hide()
	choice_container.hide()
	continue_label.show()


func advance_dialogue():
	current_index += 1

	print("Index ", current_index)

	if current_index >= dialogue_lines.size():
		hide_dialogue()
		return

	show_current_line()


func hide_dialogue():
	print("Hiding Dialogue")
	# Move characters before closing dialogue
	##get_tree().current_scene.move_to_table()
	hide()

	dialogue_lines = []
	current_index = 0
	choices_active = false

	DialogueManager.mark_dialogue_closed()


func _unhandled_input(event):
	if not visible:
		return

	if choices_active:

		if event.is_action_pressed("move_up"):
			move_choice(-1)
			get_viewport().set_input_as_handled()

		elif event.is_action_pressed("move_down"):
			move_choice(1)
			get_viewport().set_input_as_handled()

		elif event.is_action_pressed("interact"):
			select_choice()
			get_viewport().set_input_as_handled()

		return

	if event.is_action_pressed("interact"):
		advance_dialogue()
		get_viewport().set_input_as_handled()


func is_dialogue_active():
	return visible
