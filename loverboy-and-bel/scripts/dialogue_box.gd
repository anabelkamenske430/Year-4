extends Control

@onready var speaker_label = $PanelContainer/MarginContainer/VBoxContainer/SpeakerLabel
@onready var dialogue_label = $PanelContainer/MarginContainer/VBoxContainer/DialogueLabel

func _ready():
	hide()


func show_dialogue(speaker: String, text: String):
	speaker_label.text = speaker
	dialogue_label.text = text
	show()


func hide_dialogue():
	hide()
