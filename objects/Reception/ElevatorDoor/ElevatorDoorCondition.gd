extends Reference
class_name ElevatorDoorCondition


func _is_condition_met(action_name: String) -> bool:
	match(action_name):
		"ElevatorDoorPush01":
			return not GameState.save_game.reception_elevator_button_pressed
		"ElevatorDoorPush02":
			return GameState.save_game.reception_elevator_button_pressed && \
				not Inventory.has_object("ScrewDriver")
		"ElevatorDoorPush03":
			return GameState.save_game.reception_elevator_button_pressed && \
				Inventory.has_object("ScrewDriver") && \
				not GameState.save_game.reception_elevator_open
		"ElevatorDoorPush04":
			return GameState.save_game.reception_elevator_button_pressed && \
				Inventory.has_object("ScrewDriver") && \
				GameState.save_game.reception_elevator_open
	return false
