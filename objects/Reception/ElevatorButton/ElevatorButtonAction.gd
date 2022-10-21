extends Reference
class_name ElevatorButtonAction


func _execute(action_name: String) -> void:
	GameState.elevatorButtonPressed = 1
