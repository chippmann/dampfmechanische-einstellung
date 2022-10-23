extends Reference
class_name Pipe_Defect_InventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	Inventory.add_item("Pipe_Defect", { "preview": "res://assets/texture/ElevatorMain/Wartungsschacht_Handle_Old.png" })
	ActionRelay.trigger("Pipe_Defect", "set_visible", [false])
	ActionRelay.trigger("Pipe_Spacer", "set_visible", [true])
