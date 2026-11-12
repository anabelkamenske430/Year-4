extends Area2D

func interact():
	var bowling_scene = get_tree().current_scene

	bowling_scene.has_bowling_ball = true

	DialogueManager.start_dialogue([
		{
			"speaker": "",
			"text": "You picked up a bowling ball."
		}
	])

	queue_free()
