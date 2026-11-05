extends Control

@onready var title_label = $PanelContainer/MarginContainer/VBoxContainer/TitleLabel
@onready var description_label = $PanelContainer/MarginContainer/VBoxContainer/DescriptionLabel


func _ready():
	hide()


func show_achievement(title: String, description: String):
	title_label.text = title
	description_label.text = description

	show()

	await get_tree().create_timer(3.0).timeout

	hide()
