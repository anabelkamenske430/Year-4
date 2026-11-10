extends Node2D

const FirstDateDialogue = preload("res://dialogue/first_date_dialogue.gd")

var story_step = 0
var target_position = null

func _ready():
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

func move_to_table():
	$Loverboy.move_to_target(
		$LoverboySeatPosition.global_position
	)
	$Bel.move_to_position(
		$BelSeatPosition.global_position
	)


func _on_dialogue_finished():
	match story_step:
		0:
			story_step = 1
			start_hour_one()

		1:
			story_step = 2
			start_hour_two()

		2:
			story_step = 3
			start_hour_three()

		3:
			story_step = 4
			start_hour_four()

		4:
			story_step = 5
			finish_first_date()


func start_hour_one():
	DialogueManager.start_dialogue(
		FirstDateDialogue.get_hour_one()
	)


func start_hour_two():
	DialogueManager.start_dialogue(
		FirstDateDialogue.get_hour_two()
	)


func start_hour_three():
	DialogueManager.start_dialogue(
		FirstDateDialogue.get_hour_three()
	)


func start_hour_four():
	DialogueManager.start_dialogue(
		FirstDateDialogue.get_hour_four()
	)


func finish_first_date():
	print("FIRST DATE COMPLETE")
	$AchievementPopup.show_achievement(
		"STILL HERE",
		"Leave the pepperspray at home next time?"
	)

	$GameBoundaries/WelcomeBoundary.set_deferred("disabled", true)


func _on_welcome_exit_body_entered(body):
	if body == $Loverboy:
		print("LOVERBOY EXITED THE RESTAURANT")
