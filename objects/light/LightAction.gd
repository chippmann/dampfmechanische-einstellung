extends Action
class_name LightAction


func _execute() -> void:
	Inventory.use_item("light_bulb")
