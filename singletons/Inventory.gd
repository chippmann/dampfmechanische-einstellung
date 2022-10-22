extends Node
# class name provided through autoload
#class_name Inventory

signal item_added(item_id, item_content)
signal item_removed(item_id)


func has_object(objectId: String) -> bool:
	return GameState.save_game.inventory.has(objectId)


func use_item(objectId: String) -> Object:
	var object = GameState.save_game.inventory.get(objectId)
	var _ignored = GameState.save_game.inventory.erase(objectId)
	emit_signal("item_removed", objectId)
	return object


func get_item(objectId: String) -> Object:
	return GameState.save_game.inventory.get(objectId)

func add_item(objectId: String, objectContent = {}) -> void:
	GameState.save_game.inventory[objectId] = objectContent
	emit_signal("item_added", objectId, objectContent)


func get_inventory() -> Dictionary:
	return GameState.save_game.inventory
