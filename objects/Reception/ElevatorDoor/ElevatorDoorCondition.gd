extends Reference
class_name ElevatorDoorCondition


func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"ElevatorDoorPush01":
			return not GameState.receptionElevatorButtonPressed
		"ElevatorDoorPush02":
			return GameState.receptionElevatorButtonPressed && \
				not Inventory.has_object("ScrewDriver")
		"ElevatorDoorPush03":
			return GameState.receptionElevatorButtonPressed && \
				Inventory.has_object("ScrewDriver") && \
				not GameState.receptionElevatorOpen
		"ElevatorDoorPush04":
			return GameState.receptionElevatorButtonPressed && \
				Inventory.has_object("ScrewDriver") && \
				Inventory.has_object("ScrewDriver") && \
				GameState.receptionElevatorOpen
	return false
