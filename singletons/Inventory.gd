extends Node
# class name provided through autoload
#class_name Inventory


func has_object(objectId: String) -> bool:
	return GameState.save_game.inventory.has(objectId)


func use_item(objectId: String) -> Object:
	var object = GameState.save_game.inventory.get(objectId)
	var _ignored = GameState.save_game.inventory.erase(objectId)
	return object


func add_item(objectId: String, objectContent = {}) -> void:
	GameState.save_game.inventory[objectId] = objectContent
