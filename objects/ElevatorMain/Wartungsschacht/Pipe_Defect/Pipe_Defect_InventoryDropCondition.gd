extends Reference
class_name Pipe_Defect_CanInventoryDropCondition


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	return inventory_id == "Wrench" && !Inventory.has_object("Pipe_Defect")
