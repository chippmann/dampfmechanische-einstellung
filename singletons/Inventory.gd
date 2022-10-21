extends Node
# class name provided through autoload
#class_name Inventory

var _inventory := {
	"light_bulb": {
		
	}
}


func has_object(objectId: String) -> bool:
	return _inventory.has(objectId)


func use_item(objectId: String) -> Object:
	var object = _inventory.get(objectId)
	var _ignored = _inventory.erase(objectId)
	return object


func add_item(objectId: String, objectContent = {}) -> void:
	_inventory[objectId] = objectContent
