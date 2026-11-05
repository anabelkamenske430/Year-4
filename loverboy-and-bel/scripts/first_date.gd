extends Node2D

var first_conversation_finished = false


func _ready():
	DialogueManager.dialogue_finished.connect(_on_dialogue_finished)


func _on_dialogue_finished():
	if first_conversation_finished:
		return

	first_conversation_finished = true
	first_date_conversation_finished()


func first_date_conversation_finished():
	print("First date conversation finished!")
