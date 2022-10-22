extends CanInventoryDropCondition
class_name TestCanInventoryDropCondition


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	return true
