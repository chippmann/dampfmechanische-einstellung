extends Reference
class_name TableauCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"TableauClosed":
			return !GameState.save_game.act01_tableau_open
		"TableauOpen":
			return GameState.save_game.act01_tableau_open
	return false
