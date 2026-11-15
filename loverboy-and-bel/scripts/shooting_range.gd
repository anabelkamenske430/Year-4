extends Node2D

var has_rifle = false
var current_shot = 0
var max_shots = 5
var range_started = false
var exit_locked = true

const RangeDialogue = preload(
	"res://dialogue/range_dialogue.gd"
)

func _ready():
	DialogueManager.start_dialogue(
		RangeDialogue.get_intro()
	)
	
func move_bel_to_seat():
	$Bel.follow_path([
		$BelSeat.global_position
	])

func start_shooting():
	if range_started:
			return

	range_started = true
	print("RANGE SHOOTING STARTED!")

	DialogueManager.start_dialogue([
		{
			"speaker": "Bel",
			"text": "Show me the way."
		},
		{
			"event": "start_range_game"
		}
	])

func start_range_game():
	$ShootingMinigame.start_game()

func record_shots(result):
	current_shot += 1
	print("Throw ", current_shot, ": ", result)

	if current_shot >= max_shots:
		print("Shooting Complete!")
		return true

	return false

func react_to_shooting_result(result):
	print("Reacting to: ", result)
	match result:
		"BULLSEYE":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "...Should I be concerned for my well being?"
				},
				{
					"event": "next_shot"
				}
			])
		"LETHAL":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "I'm sure anyone could do that."
				},
				{
					"event": "next_shot"
				}
			])
		"HIT":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "I mean you hit the target at least!"
				},
				{
					"event": "next_shot"
				}
			])
		"MISS":
			DialogueManager.start_dialogue([
				{
					"speaker": "Bel",
					"text": "I'm starting to think I should find a different teacher"
				},
				{
					"event": "next_shot"
				}
			])

func receive_shooting_result(result):
	print("Shooting received: ", result)
	var shooting_complete = record_shots(result)

	if shooting_complete:
		DialogueManager.start_dialogue([
			{
				"speaker": "Bel",
				"text": "Okay, can I try?"
			},
			{
				"speaker": "Loverboy",
				"text": "Sure! Just make sure to.."
			},
			{
				"event": "bel_goes_feral"
			}
		])
		return

	react_to_shooting_result(result)

func next_shot():

	print("Starting next shot")
	$ShootingMinigame.start_game()

func start_bel_chaos():

	$Bel.move_to_position($BelChaos1.global_position)
	await $Bel.wait_until_arrived()
	DialogueManager.start_dialogue([
		{
			"speaker": "Bel",
			"text": "PEW. PEW."
		}
	])
	await DialogueManager.dialogue_finished

	$Bel.move_to_position($BelChaos2.global_position)
	await $Bel.wait_until_arrived()
	DialogueManager.start_dialogue([
		{
			"speaker": "Bel",
			"text": "WAIT THERE'S MORE."
		}
	])
	await DialogueManager.dialogue_finished

	$Bel.move_to_position($BelChaos3.global_position)
	await $Bel.wait_until_arrived()
	DialogueManager.start_dialogue([
	{
		"speaker": "Bel",
		"text": "LOOK I HIT ONE."
	},
	{
		"speaker": "Bel",
		"text": "I WANT ONE!!!"
	},
	{
		"speaker": "Loverboy",
		"text": "Bel..."
	},
	{
		"event": "finish_shooting"
	}
	])

func finish_shooting():
	$AchievementPopup.show_achievement(
		"Machine Gun Chaos",
		"I've Created a Monster."
	)

	print("Unlock door")
	exit_locked = false
	$GameBoundaries/WelcomeExitBoundary.set_deferred("disabled", true)


func _on_range_exit_body_entered(body: Node2D) -> void:
	if body != $Loverboy:
		return
	if exit_locked:
		print("EXIT LOCKED")
		return
	print("LOVERBOY EXITED THE GUN RANGE")
		
	get_tree().change_scene_to_file(
		"res://scenes/levels/outside_house.tscn"
	)
