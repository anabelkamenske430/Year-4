extends Node2D


func _ready():
	# Ellen starts hidden.
	$EllenSuprise.hide()

	# Give the new scene a moment to load.
	await get_tree().create_timer(0.5).timeout

	start_house_sequence()


func start_house_sequence():
	# Walk Bel and Loverboy farther into the room.
	$Bel.move_to_position(
		$BelPosition.global_position
	)

	$Loverboy.move_to_target(
		$LoverboyPosition.global_position
	)

	# Wait until BOTH characters are in position.
	await $Bel.wait_until_arrived()
	await $Loverboy.wait_until_arrived()

	await get_tree().create_timer(0.5).timeout

	start_first_dialogue()


func start_first_dialogue():
	DialogueManager.start_dialogue([
		{
			"speaker": "Bel",
			"text": "You're kidding me."
		},
		{
			"speaker": "Loverboy",
			"text": "I'm not."
		},
		{
			"speaker": "",
			"text": "",
			"event": "ellen_surprise"
		}
	])


func ellen_surprise():
	$EllenSuprise.show()

	await get_tree().create_timer(0.3).timeout

	DialogueManager.start_dialogue([
		{
			"speaker": "Ellen",
			"text": "SURPRISE!"
		},
		{
			"speaker": "Bel",
			"text": "AHHH!"
		},
		{
			"speaker": "Bel",
			"text": "You knew???"
		},
		{
			"speaker": "Bel",
			"text": "Did Lindsey know?"
		},
		{
			"speaker": "Loverboy",
			"text": "Yeah."
		},
		{
			"speaker": "Bel",
			"text": "I hate you so much."
		},
		{
			"speaker": "",
			"text": "",
			"event": "house_complete"
		}
	])


func house_complete():
	$AchievementPopup.show_achievement(
		"HOME SWEET HOME",
		"Made Bel cry like a potato."
	)
	
	await get_tree().create_timer(3.5).timeout
	
	print("ACHIEVEMENT WAIT FINISHED")
	print("STARTING FADE")
	fade_to_ending()
	
func fade_to_ending():
	# Make sure the fade overlay starts completely transparent.
	$FadeRect.modulate.a = 0.0
	$FadeRect.show()

	# Allow Godot to render the transparent state first.
	await get_tree().process_frame

	var tween = create_tween()

	tween.tween_property(
		$FadeRect,
		"modulate:a",
		1.0,
		2.0
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	await tween.finished

	# Let the fully black screen sit for just a beat.
	await get_tree().create_timer(0.4).timeout

	get_tree().change_scene_to_file(
		"res://scenes/levels/ending.tscn"
	)
