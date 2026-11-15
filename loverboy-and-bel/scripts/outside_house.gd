extends Node2D

const OutsideHouseDialogue = preload(
	"res://dialogue/outside_house_dialogue.gd"
)

func _ready():
	$Bel.hide()
	$Loverboy.hide()

	DialogueManager.start_dialogue(
		OutsideHouseDialogue.get_intro()
	)

func exit_truck():
	print("EXITING TRUCK")
	
	$OccupiedTruck.hide()
	$Bel.show()
	$Loverboy.show()
