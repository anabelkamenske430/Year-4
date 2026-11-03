extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta):
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
	var areas = $InteractionArea.get_overlapping_areas()

	for area in areas:
		if area.has_method("interact"):
			area.interact()
			return
