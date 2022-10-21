extends Action
class_name ScrewDriverAction


func _execute(action_name: String) -> void:
	Inventory.add_item("ScrewDriver")
	ActionRelay.trigger("ScrewDriver", "set_visible", [false])
	if GameState.elevatorButtonPressed == 1:
		print("Victory!! Puzzle solved! Open Elevator!")
