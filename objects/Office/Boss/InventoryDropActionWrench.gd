extends Reference
class_name WrenchInventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	Inventory.use_item("Wrench")
	GameState.change_scene_to(7)
