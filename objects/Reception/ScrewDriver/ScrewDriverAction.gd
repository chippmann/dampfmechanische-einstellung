extends Action
class_name ScrewDriverAction


func _execute(action_name: String) -> void:
	Inventory.add_item("ScrewDriver")
	ActionRelay.trigger("ScrewDriver", "set_visible", [false])
	if GameState.receptionElevatorButtonPressed:
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])
