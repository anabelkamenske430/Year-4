extends Node2D

const OutsideHouseDialogue = preload(
	"res://dialogue/outside_house_dialogue.gd"
)

func _ready():
	$Bel.hide()
	$Loverboy.hide()
	$HouseKey.hide()

	DialogueManager.start_dialogue(
		OutsideHouseDialogue.get_intro()
	)
	
func exit_truck():
	print("EXITING TRUCK")
	
	$OccupiedTruck.hide()
	$Bel.show()
	$Loverboy.show()
	
	await get_tree().create_timer(1.0).timeout
	
	walk_to_front_door()
	
func walk_to_front_door():
	$Loverboy.follow_path([
		$LoverboyWaypoint1.global_position,
		$LoverboyWaypoint2.global_position,
		$LoverboyDoorPosition.global_position
	])

	$Bel.follow_path([
		$BelWaypoint1.global_position,
		$BelWaypoint2.global_position,
		$BelDoorPosition.global_position
	])
	
	await $Bel.wait_until_arrived()
	await $Loverboy.wait_until_arrived()
	
	show_house_key()

func show_house_key():
	print("SHOWING HOUSE KEY")
	await get_tree().create_timer(0.5).timeout
	$HouseKey.show()
	await get_tree().create_timer(2.0).timeout
	$HouseKey.hide()

	start_door_dialogue()
	
func start_door_dialogue():
	DialogueManager.start_dialogue(
		OutsideHouseDialogue.get_door_dialogue()
	)

func go_to_inside_house():
	get_tree().change_scene_to_file(
		"res://scenes/levels/inside_house.tscn"
	)
