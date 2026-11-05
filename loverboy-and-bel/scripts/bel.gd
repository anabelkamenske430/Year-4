extends Area2D

func interact():
	print("Bel Called")
	DialogueManager.start_dialogue([
		{
			"speaker": "BEL",
			"text": "Well... this is awkward."
		},
		{
			"speaker": "LOVERBOY",
			"text": "You're telling me."
		}
	])
