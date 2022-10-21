extends Condition
class_name LightCondition


func _is_condition_met(action_name: String) -> bool:
	return Inventory.has_object("light_bulb")
