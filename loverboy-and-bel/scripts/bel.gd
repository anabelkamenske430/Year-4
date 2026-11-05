extends Area2D

var dialogue = [
	{
		"speaker": "Bel",
		"text": "So... four hours on our first date.",
		"choices": [
			{
				"text": "Best four hours of my life.",
				"response": "Best four hours of my life."
			},
			{
				"text": "Honestly, I'm surprised you weren't sick of me.",
				"response": "Honestly, I'm surprised you weren't sick of me."
			},
			{
				"text": "I was trying to escape.",
				"response": "I was trying to escape."
			}
		]
	},
	{
		"speaker": "Bel",
		"text": "Yeah... you're stuck with me now."
	}
]

func interact():
	print("Bel Called")
	DialogueManager.start_dialogue(dialogue)
