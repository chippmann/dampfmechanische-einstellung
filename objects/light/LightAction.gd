extends Action
class_name LightAction


func _execute() -> void:
	var _light_bulb = Inventory.use_item("light_bulb")
