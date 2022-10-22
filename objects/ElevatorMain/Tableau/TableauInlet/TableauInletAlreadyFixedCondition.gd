extends Reference
class_name TableauInletAlreadyFixed


func _is_condition_met(_action_name: String) -> bool:
	return GameState.save_game.act01_screwdriver_in_fuse
