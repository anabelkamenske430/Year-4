extends Node2D

var has_bowling_ball = false
var current_throw = 0
var max_throws = 5
var bowling_started = false
var door_locked = true

const BowlingDialogue = preload(
	"res://dialogue/bowling_dialogue.gd"
)

func _ready():
	DialogueManager.start_dialogue(
		BowlingDialogue.get_intro()
	)
	
func move_bel_to_lane():
	$Bel.follow_path([
		$BelWaypoint1.global_position,
		$BelWaypoint2.global_position,
		$BelSeat.global_position
	])

func start_bowling():
	if bowling_started:
			return

	bowling_started = true
	print("BOWLING STARTED!")

	DialogueManager.start_dialogue([
		{
			"speaker": "Bel",
			"text": "Let's see what you've got."
		},
		{
			"event": "start_bowling_game"
		}
	])

func start_bowling_game():
	$BowlingMinigame.start_game()

func record_throw(result):
	current_throw += 1
	print("Throw ", current_throw, ": ", result)

	if current_throw >= max_throws:
		print("Bowling Complete!")
		return true

	return false

func react_to_bowling_result(result):
	print("Reacting to: ", result)
	match result:
		"STRIKE":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "Okay, show-off."
				},
				{
					"event": "next_bowling_throw"
				}
			])
		"7 PINS":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "Not bad."
				},
				{
					"event": "next_bowling_throw"
				}
			])
		"3 PINS":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "I've seen worse."
				},
				{
					"event": "next_bowling_throw"
				}
			])
		"GUTTER BALL":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "That was definitely one way to throw it."
				},
				{
					"event": "next_bowling_throw"
				}
			])

func receive_bowling_result(result):
	print("=== RECEIVE BOWLING RESULT CALLED ===")
	print("Bowling received: ", result)
	var bowling_complete = record_throw(result)

	if bowling_complete:
		DialogueManager.start_dialogue([
			{
				"speaker": "Bel",
				"text": "Looks like we're done bowling."
			},
			{
				"speaker": "Bel",
				"text": "Well that was fun, I totally kicked your ass"
			},
			{
				"speaker": "Loverboy",
				"text": "The lane was totally rigged"
			},
			{
				"speaker": "Bel",
				"text": "Sureee it was Loverboy"
			},
			{
				"speaker": "Bel",
				"text": "Let's blow this popsicle stand!"
			},
			{
				"event": "finish_bowling"
			}
		])
		return

	react_to_bowling_result(result)

func next_bowling_throw():

	print("Starting next throw")
	$BowlingMinigame.start_game()

func finish_bowling():
	$AchievementPopup.show_achievement(
		"Alley Cat",
		"Finished a game of bowling with Bel."
	)

	print("Unlock door")
	door_locked = false
	$GameBoundaries/WelcomeBoundary.set_deferred("disabled", true)

func _on_bowling_exit_body_entered(body: Node2D) -> void:
	if body != $Loverboy:
		return
	if door_locked:
		print("EXIT LOCKED")
		return
	print("LOVERBOY EXITED THE BOWLING ALLEY")
		
	get_tree().change_scene_to_file(
		"res://scenes/levels/shooting_range.tscn"
	)
