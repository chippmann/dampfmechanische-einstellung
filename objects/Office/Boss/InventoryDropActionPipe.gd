extends Reference
class_name PipeInventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	Inventory.use_item("Pipe_Defect")
