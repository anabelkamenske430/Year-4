extends Area2D


func interact():
	var dialogue_box = get_tree().current_scene.get_node("DialogueBox")

	dialogue_box.show_dialogue(
		"BEL",
		"Well... this is awkward."
	)
