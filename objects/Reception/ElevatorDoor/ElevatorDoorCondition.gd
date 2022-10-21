extends Reference
class_name ElevatorDoorCondition


func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"ElevatorDoorPush01":
			return GameState.elevatorButtonPressed == 0
		"ElevatorDoorPush02":
			return GameState.elevatorButtonPressed == 1
	return false
