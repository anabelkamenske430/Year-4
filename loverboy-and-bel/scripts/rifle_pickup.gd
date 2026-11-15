extends Area2D

func interact():
	var range_scene = get_tree().current_scene
	range_scene.has_rifle = true

	DialogueManager.start_dialogue([
		{
			"speaker": "",
			"text": "You picked up a rifle."
		}
	])

	queue_free()
