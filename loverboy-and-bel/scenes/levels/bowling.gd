extends Node2D

var has_bowling_ball = false

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
