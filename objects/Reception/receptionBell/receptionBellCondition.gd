extends Condition
class_name receptionBellCondition


#not used anymore...
func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"receptionBellRing1to4":
			return GameState.receptionBellCount <= 4
		"receptionBellRing5to9":
			return GameState.receptionBellCount <= 9
		"receptionBellRing10to14":
			return GameState.receptionBellCount <= 14
		"receptionBellRing15up":
			return GameState.receptionBellCount >= 15
	return false
	
