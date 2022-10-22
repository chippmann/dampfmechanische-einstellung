extends Condition
class_name receptionReceptionistCondition


func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"receptionReceptionistWait01":
			return GameState.save_game.reception_bell_count == 5
		"receptionReceptionistWait02":
			return GameState.save_game.reception_bell_count == 10
		"receptionReceptionistGoTo30":
			return GameState.save_game.reception_bell_count == 15
	return false
	
