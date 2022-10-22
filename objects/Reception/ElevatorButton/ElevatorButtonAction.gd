extends Reference
class_name ElevatorButtonAction


func _execute(_action_name: String) -> void:
	GameState.receptionElevatorButtonPressed = true
	if Inventory.has_object("ScrewDriver") and not GameState.receptionElevatorOpen:
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])
