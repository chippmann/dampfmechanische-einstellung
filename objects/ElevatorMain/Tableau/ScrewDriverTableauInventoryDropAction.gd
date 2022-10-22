extends Reference
class_name ScrewDriverTableauInventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	GameState.save_game.act01_tableau_open = true
