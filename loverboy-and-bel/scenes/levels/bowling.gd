extends Node2D

const BowlingDialogue = preload(
	"res://dialogue/bowling_dialogue.gd"
)

func _ready():
	DialogueManager.start_dialogue(
		BowlingDialogue.get_intro()
	)
