extends Resource

static func get_dialogue() -> Array:
	return [
		{
			"speaker": "Bel",
			"text": "So... you're real."
		},
		{
			"speaker": "Loverboy",
			"text": "Apparently."
		},
		{
			"speaker": "Bel",
			"text": "That's reassuring."
		},
		{
			"speaker": "Bel",
			"text": "So... how nervous are you right now?",
			"choices": [
				{
					"text": "Not at all.",
					"response": "Not at all."
				},
				{
					"text": "A perfectly normal amount.",
					"response": "A perfectly normal amount."
				},
				{
					"text": "I'm considering leaving.",
					"response": "I'm considering leaving."
				}
			]
		},
		{
			"speaker": "Bel",
			"text": "Well... let's see how this goes."
		}
	]
