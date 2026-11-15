extends Control

@onready var marker = $Marker
@onready var target = $RangeTarget
@onready var result_label = $ResultLabel

var move_speed = 300.0
var direction = 1
var marker_position = 0.0
var game_active = true
var target_width = 0.00

func _ready():
	hide()
	target_width = target.texture.get_width() * target.scale.x
	result_label.text = "Waiting..."

func _process(delta):
	if not game_active:
		return
		
	marker.position.x += move_speed * direction * delta

	if marker.position.x >= target_width:
		direction = -1

	if marker.position.x <= 0:
		direction = 1

func _unhandled_input(event):
	if not visible:
		return

	if event.is_action_pressed("interact") and game_active:
		game_active = false
		var result = calculate_result()
		
		result_label.text = result
		print(result)

		await get_tree().create_timer(1.5).timeout
		print("Ready for next step")
		
		get_tree().current_scene.receive_shooting_result(result)
		hide()
		
func start_game():

	game_active = true
	result_label.text = "Waiting..."

	marker.position.x = 0
	direction = 1
	show()

func calculate_result():

	var percent = marker.position.x / target_width

	if percent < 0.15:
		return "MISS"
	elif percent < 0.35:
		return "HIT"
	elif percent < 0.45:
		return "LETHAL"
	elif percent < 0.55:
		return "BULLSEYE"
	elif percent < 0.65:
		return "LETHAL"
	elif percent < 0.85:
		return "HIT"
	else:
		return "MISS"
