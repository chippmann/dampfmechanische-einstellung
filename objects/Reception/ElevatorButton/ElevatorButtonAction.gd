extends Action
class_name ElevatorButtonAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	GameState.save_game.reception_elevator_button_pressed = true
	if Inventory.has_object("ScrewDriver") and not GameState.save_game.reception_elevator_open:
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])
