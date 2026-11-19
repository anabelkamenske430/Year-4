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

static func get_door_dialogue():
	return [
		{
			"speaker" : "Bel",
			"text" : "No you didn't...."
		},
		{
			"speaker" : "Loverboy",
			"text" : "Come on"
		},
		{
			"speaker" : "Bel",
			"text" : "You're fucking joking right now"
		},
		{
			"speaker" : "Loverboy",
			"text" : "Only one way to really find out"
		},
		{
			"event": "go_to_inside_house"
		}
	]
