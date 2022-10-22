extends Reference
class_name ScrewDriverOpensTableauCanInventoryDropCondition


func _can_handle_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	match(_action_name):
		"TableauAufschrauben":
				return inventory_id == "ScrewDriver" && !GameState.save_game.act01_tableau_open
		"TableauNichtZuschrauben":
				return inventory_id == "ScrewDriver" && GameState.save_game.act01_tableau_open
	return false
