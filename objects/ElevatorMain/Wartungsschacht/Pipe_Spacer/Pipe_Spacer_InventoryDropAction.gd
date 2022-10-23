extends Reference
class_name Pipe_Spacer_InventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	var _item = Inventory.use_item(inventory_id)
	ActionRelay.trigger("Pipe_Defect", "set_visible", [false])
	ActionRelay.trigger("Pipe_Spacer", "set_visible", [false])
	ActionRelay.trigger("Pipe_Functional", "set_visible", [true])
	GameState.save_game.act01_wartungsschacht_functional_pipe_placed = true
