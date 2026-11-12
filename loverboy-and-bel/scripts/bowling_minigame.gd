extends Control

@onready var marker = $Marker
@onready var accuracy_bar = $AccuracyBar

var move_speed = 300.0
var direction = 1
var marker_position = 0.0
var game_active = true


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
		print("Marker stopped at: ", marker.position.x)
		calculate_result()

func calculate_result():

	var percent = marker.position.x / accuracy_bar.size.x
	print("Percent: ", percent)
	if percent < 0.15:
		print("MISS")
	elif percent < 0.35:
		print("OK")
	elif percent < 0.45:
		print("GOOD")
	elif percent < 0.55:
		print("STRIKE")
	elif percent < 0.65:
		print("GOOD")
	elif percent < 0.85:
		print("OK")
	else:
		print("MISS")
