extends Reference
class_name WrenchFunctionalPipeDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	Inventory.add_item("Pipe_Functional", { "preview": "res://assets/texture/ElevatorMain/Inventory_Preview_Pipe.png" })
	ActionRelay.trigger("Pipe_Functional", "set_visible", [false])
	
