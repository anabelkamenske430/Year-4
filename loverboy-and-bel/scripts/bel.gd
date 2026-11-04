extends Area2D

func interact():
	print("Bel Called")
	var dialogue_box = get_tree().current_scene.get_node("DialogueBox")

	dialogue_box.start_dialogue([
		{
			"speaker": "BEL",
			"text": "Well... this is awkward."
		},
		{
			"speaker": "LOVERBOY",
			"text": "You're telling me."
		}
	])
