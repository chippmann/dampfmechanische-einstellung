extends Resource
class_name SaveGame

export var save_game_path: String = "user://savegame.tres"

export var current_stage: int = 0

export var inventory: Dictionary = {}

export var reception_bell_count: int = 0
export var reception_elevator_button_pressed: bool = false
export var reception_elevator_open: bool = false


func has_object(objectId: String) -> bool:
	return inventory.has(objectId)


func use_item(objectId: String) -> Object:
	var object = inventory.get(objectId)
	var _ignored = inventory.erase(objectId)
	return object


func add_item(objectId: String, objectContent = {}) -> void:
	inventory[objectId] = objectContent