extends Condition
class_name receptionReceptionistCondition


func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"receptionReceptionistWait01":
			return GameState.receptionBellCount == 5
		"receptionReceptionistWait02":
			return GameState.receptionBellCount == 10
		"receptionReceptionistGoTo30":
			return GameState.receptionBellCount == 15
	return false
	
