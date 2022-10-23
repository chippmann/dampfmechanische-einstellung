extends Reference
class_name InventoryOnDoor


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	return !GameState.save_game.act01_door_open
