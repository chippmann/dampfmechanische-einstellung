extends Resource
class_name SaveGame

export var save_game_path: String = "user://savegame.tres"

export var current_stage: int = 0

export var player_position: Dictionary = {}
export var inventory: Dictionary = {}

export var reception_bell_count: int = 0
export var reception_elevator_button_pressed: bool = false
export var reception_elevator_open: bool = false
export var act01_tableau_open: bool = false
export var act01_screwdriver_in_fuse: bool = false
export var act01_wartungsschacht_offen: bool = false
export var act01_wartungsschacht_functional_pipe_placed: bool = false
export var act01_bedienfeld_buttonpressedfirsttime: bool = false
export var act01_door_open: bool = true
export var act01_current_floor: int = 1
export var epilogue_talked: bool = false
export var epilogue_wrenchgiven: bool = false


func has_object(objectId: String) -> bool:
	return inventory.has(objectId)


func use_item(objectId: String) -> Object:
	var object = inventory.get(objectId)
	var _ignored = inventory.erase(objectId)
	return object


func add_item(objectId: String, objectContent = {}) -> void:
	inventory[objectId] = objectContent
