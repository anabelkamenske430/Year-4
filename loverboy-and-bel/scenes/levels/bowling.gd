extends Node2D

var has_bowling_ball = false

const BowlingDialogue = preload(
	"res://dialogue/bowling_dialogue.gd"
)

func _ready():
	DialogueManager.start_dialogue(
		BowlingDialogue.get_intro()
	)
