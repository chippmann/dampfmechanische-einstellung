extends Action
class_name LightAction


func _execute(action_name: String) -> void:
	var _light_bulb = Inventory.use_item("light_bulb")
