extends Reference
class_name BedienfeldButtonsOpenCloseCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"BedienfeldButtonOpen":
			return !GameState.save_game.act01_door_open
		"BedienfeldButtonOpenAlready":
			return GameState.save_game.act01_door_open
		"BedienfeldButtonClose":
			return GameState.save_game.act01_door_open
		"BedienfeldButtonCloseAlready":
			return !GameState.save_game.act01_door_open
	return false
