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
					"branch": [
						{
							"speaker": "Loverboy",
							"text": "Not at all."
						},
						{
							"speaker": "Bel",
							"text": "Wow. One of us should be worried."
						}
					]
				},
				{
					"text": "A perfectly normal amount.",
					"branch": [
						{
							"speaker": "Loverboy",
							"text": "A perfectly normal amount."
						},
						{
							"speaker": "Bel",
							"text": "Good. That means you're human."
						}
					]
				},
				{
					"text": "I'm considering leaving.",
					"branch": [
						{
							"speaker": "Loverboy",
							"text": "I'm considering leaving."
						},
						{
							"speaker": "Bel",
							"text": "At least wait until after dinner."
						}
					]
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
