extends Reference
class_name InventoryIsWrenchDropCondition


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	return inventory_id == "Wrench"
