extends Reference
class_name DoorCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"Door1":
			return GameState.save_game.act01_door_open && GameState.save_game.act01_current_floor == 1
		"Door2-29":
			return GameState.save_game.act01_door_open && GameState.save_game.act01_current_floor == 2
		"Door30":
			return GameState.save_game.act01_door_open && GameState.save_game.act01_current_floor == 30
		"DoorClosed":
			return !GameState.save_game.act01_door_open
	return false
