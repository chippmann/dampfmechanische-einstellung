extends Reference
class_name ElevatorButtonAction


func _execute(action_name: String) -> void:
	GameState.elevatorButtonPressed = 1
	if Inventory.has_object("ScrewDriver"):
		print("Victory!! Puzzle solved! Open Elevator!")
