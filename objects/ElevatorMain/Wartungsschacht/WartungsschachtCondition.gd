extends Reference
class_name WartungsschachtCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"WartungsschachtZu":
			return !GameState.save_game.act01_wartungsschacht_offen
		"WartungsschachtOffen":
			return GameState.save_game.act01_wartungsschacht_offen
	return false
