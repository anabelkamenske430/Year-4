extends Area2D

const FirstDateDialogue = preload("res://dialogue/first_date_dialogue.gd")

@export var dialogue_type: String = "test"


func interact():
	var dialogue = get_dialogue()

	if dialogue.size() > 0:
		DialogueManager.start_dialogue(dialogue)


func get_dialogue() -> Array:
	match dialogue_type:
		"first_date":
			return FirstDateDialogue.get_dialogue()

		_:
			return [
				{
					"speaker": "Bel",
					"text": "Well... this is awkward."
				}
			]
