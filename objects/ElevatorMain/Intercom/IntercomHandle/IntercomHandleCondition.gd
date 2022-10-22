extends Reference
class_name IntercomHandleCondition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"IntercomHandle":
			return !GameState.save_game.act01_screwdriver_in_fuse
		"IntercomHandleUeberladen":
			return GameState.save_game.act01_screwdriver_in_fuse
	return false
