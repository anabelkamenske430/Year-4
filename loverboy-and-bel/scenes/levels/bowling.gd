extends Node2D

var has_bowling_ball = false
var current_throw = 0
var max_throws = 3
var bowling_started = false

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
	else:
		print("Next throw")

func react_to_bowling_result(result):

	match result:
		"STRIKE":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "Okay, show-off."
				}
			])
		"7 PINS":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "Not bad."
				}
			])
		"3 PINS":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "I've seen worse."
				}
			])
		"GUTTER BALL":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "That was definitely one way to throw it."
				}
			])
