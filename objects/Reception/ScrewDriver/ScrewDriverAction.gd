extends Action
class_name ScrewDriverAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	Inventory.add_item(
		"ScrewDriver",
		{ "preview": "res://assets/texture/Reception/ScrewDriver.png" }
	)
	ActionRelay.trigger("ScrewDriver", "set_visible", [false])
	if GameState.save_game.reception_elevator_button_pressed:
		ActionRelay.trigger("ElevatorDoor", "emit_signal", ["pressed"])


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	if Inventory.has_object("ScrewDriver"):
		ActionRelay.trigger("ScrewDriver", "set_visible", [false])
