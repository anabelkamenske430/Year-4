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

static func get_hour_one() -> Array:
	return [
		{
			"speaker": "1 HOUR LATER...",
			"text": ""
		},
		{
			"speaker": "Bel",
			"text": "Well... apparently neither of us has anywhere else to be."
		},
		{
			"speaker": "Loverboy",
			"text": "Apparently not."
		}
	]


static func get_hour_two() -> Array:
	return [
		{
			"speaker": "2 HOURS LATER...",
			"text": ""
		},
		{
			"speaker": "Loverboy",
			"text": "Are we seriously still talking?"
		},
		{
			"speaker": "Bel",
			"text": "Looks that way."
		}
	]


static func get_hour_three() -> Array:
	return [
		{
			"speaker": "3 HOURS LATER...",
			"text": ""
		},
		{
			"speaker": "Bel",
			"text": "I'm pretty sure this stopped being a normal first date a while ago."
		}
	]


static func get_hour_four() -> Array:
	return [
		{
			"speaker": "4 HOURS LATER...",
			"text": ""
		},
		{
			"speaker": "Loverboy",
			"text": "Four hours."
		},
		{
			"speaker": "Bel",
			"text": "And somehow you're still here."
		}
	]
