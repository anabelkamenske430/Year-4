extends Resource

class_name OutsideHouseDialogue

static func get_intro() -> Array:
	return [
		{
			"speaker": "Loverboy",
			"text": "There's some Christmas lights I wanted to show you."
		},
		{
			"speaker": "Bel",
			"text": "I don't see any lights."
		},
		{
			"speaker": "Loverboy",
			"text": "Maybe the owners know something."
		},
		{
			"speaker": "Bel",
			"text": "We are absolutely NOT knocking on some random person's door."
		},
		{
			"speaker": "Loverboy",
			"text": "Trust me."
		},
		{
			"event": "exit_truck"
		}
	]
