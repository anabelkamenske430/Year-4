extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta):

	if DialogueManager.is_dialogue_active():
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
		check_interaction()


func check_interaction():
	print("Player Checking Interaction")
	if DialogueManager.consume_just_closed():
		return

	var areas = $InteractionArea.get_overlapping_areas()

	for area in areas:
		if area.has_method("interact"):
			area.interact()
			return
