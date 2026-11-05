extends Control

@onready var speaker_label = $PanelContainer/MarginContainer/VBoxContainer/SpeakerLabel
@onready var dialogue_label = $PanelContainer/MarginContainer/VBoxContainer/DialogueLabel

var dialogue_lines = []
var current_index = 0
var just_closed = false

func _ready():
	hide()

func start_dialogue(lines):
	dialogue_lines = lines
	current_index = 0

	show()
	show_current_line()

func show_current_line():
	var line = dialogue_lines[current_index]

	speaker_label.text = line["speaker"]
	dialogue_label.text = line["text"]

func advance_dialogue():
	current_index += 1
	
	print("Index ", current_index)

	if current_index >= dialogue_lines.size():
		hide_dialogue()
		return

	show_current_line()

func hide_dialogue():
	print("Hiding Dialogue")
	hide()

	dialogue_lines = []
	current_index = 0
	just_closed = true

func _unhandled_input(event):
	if not visible:
		return

	if event.is_action_pressed("interact"):
		advance_dialogue()

func is_dialogue_active():
	return visible
