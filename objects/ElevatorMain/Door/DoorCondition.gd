extends Reference
class_name DoorCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"Door":
			return GameState.save_game.act01_door_open
		"DoorClosed":
			return !GameState.save_game.act01_door_open
	return false
