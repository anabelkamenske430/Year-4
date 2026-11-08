extends CharacterBody2D

@onready var animated_sprite = $CharacterSprite
@export var speed: float = 200.0

var target_position = null

func _physics_process(_delta):

	if DialogueManager.is_dialogue_active() and target_position == null:
		velocity = Vector2.ZERO

		animated_sprite.play("idle")

		move_and_slide()
		return

	if target_position != null:
		##print("Distance: ", global_position.distance_to(target_position))
		if global_position.distance_to(target_position) < 15:
			print("Reached target!")
			target_position = null

			velocity = Vector2.ZERO
			animated_sprite.play("idle")

			return

		var direction = global_position.direction_to(target_position)

		update_animation(direction)

		velocity = direction * speed

		move_and_slide()

		return

	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	update_animation(direction)

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

func update_animation(direction: Vector2):

	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
		return

	if abs(direction.x) > abs(direction.y):

		animated_sprite.play("walk_side")

		if direction.x > 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false

	else:

		animated_sprite.flip_h = false

		if direction.y < 0:
			animated_sprite.play("walk_up")
		else:
			animated_sprite.play("walk_down")

func move_to_position(target_position):
	global_position = target_position

func move_to_target(position_to_move_to):
	target_position = position_to_move_to
