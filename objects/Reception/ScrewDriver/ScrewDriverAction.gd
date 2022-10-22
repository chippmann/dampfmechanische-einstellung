extends Action
class_name ScrewDriverAction


func _execute(_action_name: String) -> void:
	Inventory.add_item("ScrewDriver")
	ActionRelay.trigger("ScrewDriver", "set_visible", [false])
	if GameState.save_game.reception_elevator_button_pressed:
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])
