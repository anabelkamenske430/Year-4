extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta):
	var dialogue_box = get_tree().current_scene.get_node("DialogueBox")

	if dialogue_box.is_dialogue_active():
		velocity = Vector2.ZERO
		move_and_slide()
		return
		
	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * speed
	move_and_slide()

	if Input.is_action_just_pressed("interact"):
		if dialogue_box.visible:
			return

		check_interaction()

func check_interaction():
	print("Player Checking Interaction")
	var dialogue_box = get_tree().current_scene.get_node("DialogueBox")

	if dialogue_box.just_closed:
		dialogue_box.just_closed = false
		return

	var areas = $InteractionArea.get_overlapping_areas()

	for area in areas:
		if area.has_method("interact"):
			area.interact()
			return
