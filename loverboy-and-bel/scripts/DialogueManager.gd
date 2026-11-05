extends Node

signal dialogue_finished

var dialogue_box = null
var just_closed = false


func register_dialogue_box(box):
	dialogue_box = box


func start_dialogue(lines):
	if dialogue_box:
		dialogue_box.start_dialogue(lines)


func is_dialogue_active():
	if dialogue_box:
		return dialogue_box.visible

	return false


func mark_dialogue_closed():
	just_closed = true
	dialogue_finished.emit()


func consume_just_closed():
	if just_closed:
		just_closed = false
		return true

	return false
