extends Reference
class_name ElevatorButtonAction


func _execute(action_name: String) -> void:
	GameState.receptionElevatorButtonPressed = true
	if Inventory.has_object("ScrewDriver"):
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])
