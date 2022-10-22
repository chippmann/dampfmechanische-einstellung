extends Reference
class_name TableauInletInventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	GameState.save_game.act01_screwdriver_in_fuse = true
	Inventory.use_item("ScrewDriver")
	ActionRelay.trigger("Fuse_fused","set_visible",[true])
