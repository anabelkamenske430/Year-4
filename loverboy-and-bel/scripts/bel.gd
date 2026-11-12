extends Area2D

const FirstDateDialogue = preload("res://dialogue/first_date_dialogue.gd")

@export var dialogue_type: String = "test"
@export var move_speed: float = 200.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var target_position: Vector2
var is_moving: bool = false
var last_direction: Vector2 = Vector2.DOWN

var movement_path = []
var current_waypoint = 0

func _ready():
	target_position = global_position
	animated_sprite.play("idle")


func _process(delta):
	if is_moving:
		move_toward_target(delta)


func interact():
	var dialogue = get_dialogue()

	if dialogue.size() > 0:
		DialogueManager.start_dialogue(dialogue)


func get_dialogue() -> Array:
	match dialogue_type:
		"first_date":
			return FirstDateDialogue.get_dialogue()

		_:
			return [
				{
					"speaker": "Bel",
					"text": "Well... this is awkward."
				}
			]


func move_to_position(new_target_position: Vector2):
	target_position = new_target_position
	is_moving = true


func move_toward_target(delta):
	var direction = global_position.direction_to(target_position)

	if global_position.distance_to(target_position) < 2.0:
		global_position = target_position
		current_waypoint += 1
		if current_waypoint < movement_path.size():
			move_to_position(
				movement_path[current_waypoint]
			)
		else:
			is_moving = false
			animated_sprite.play("idle")
		return

	last_direction = direction
	update_walk_animation(direction)

	global_position = global_position.move_toward(
		target_position,
		move_speed * delta
	)

func follow_path(path):

	movement_path = path
	current_waypoint = 0

	move_to_position(
		movement_path[current_waypoint]
	)

func update_walk_animation(direction: Vector2):
	if abs(direction.x) > abs(direction.y):
		animated_sprite.play("walk_side")

		# Assuming your walk_side frames face right
		if direction.x > 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false

	elif direction.y < 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walk_up")

	else:
		animated_sprite.flip_h = false
		animated_sprite.play("walk_down")
