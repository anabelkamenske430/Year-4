extends Area2D

func interact():

	var bowling_scene = get_tree().current_scene

	if not bowling_scene.has_bowling_ball:

		DialogueManager.start_dialogue([
			{
				"speaker": "",
				"text": "Maybe I should grab a bowling ball first."
			}
		])

		return
		
	if bowling_scene.bowling_started:
		return

	bowling_scene.start_bowling()
