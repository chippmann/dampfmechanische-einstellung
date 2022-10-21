extends Condition
class_name LightCondition


func _is_condition_met() -> bool:
	return Inventory.has_object("light_bulb")
