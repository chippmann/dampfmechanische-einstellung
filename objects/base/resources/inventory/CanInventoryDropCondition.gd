extends Reference
class_name CanInventoryDropCondition


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	print("WARNING: no inventory drop condition defined. Returning true")
	return true
