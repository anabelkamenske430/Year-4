extends Area2D

func interact():
	var range_scene = get_tree().current_scene

	if not range_scene.has_rifle:

		DialogueManager.start_dialogue([
			{
				"speaker": "",
				"text": "Maybe I should grab something to shoot first."
			}
		])

		return
		
	if range_scene.range_started:
		return

	range_scene.start_shooting()
