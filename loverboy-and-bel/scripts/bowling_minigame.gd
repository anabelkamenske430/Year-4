extends Control

@onready var marker = $Marker
@onready var accuracy_bar = $AccuracyBar
@onready var result_label = $ResultLabel

var move_speed = 300.0
var direction = 1
var marker_position = 0.0
var game_active = true

func _ready():
	hide()
	result_label.text = "Waiting..."

func _process(delta):
	if not game_active:
		return
		
	marker.position.x += move_speed * direction * delta

	if marker.position.x >= accuracy_bar.size.x:
		direction = -1

	if marker.position.x <= 0:
		direction = 1

func _unhandled_input(event):

	if event.is_action_pressed("interact") and game_active:
		game_active = false
		var result = calculate_result()
		
		result_label.text = result
		print(result)

		await get_tree().create_timer(1.5).timeout
		print("Ready for next step")
		
func start_game():

	game_active = true
	result_label.text = "Waiting..."

	marker.position.x = 0
	direction = 1
	show()

func calculate_result():

	var percent = marker.position.x / accuracy_bar.size.x

	if percent < 0.15:
		return "GUTTER BALL"
	elif percent < 0.35:
		return "3 PINS"
	elif percent < 0.45:
		return "7 PINS"
	elif percent < 0.55:
		return "STRIKE"
	elif percent < 0.65:
		return "7 PINS"
	elif percent < 0.85:
		return "3 PINS"
	else:
		return "GUTTER BALL"
