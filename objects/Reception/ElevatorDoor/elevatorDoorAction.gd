extends Action
class_name elevatorDoorAction


func _execute(action_name: String) -> void:
	match(action_name):
		"ElevatorDoorPush03":
			GameState.save_game.reception_elevator_open = true
			ActionRelay.trigger("ElevatorDoorAnimation","play")
		"ElevatorDoorPush04":
			print("Victory!! Forward to Act01.")
			GameState.change_scene_to(GameState.Stage.ACT_1)


func _restore_state(_interactable_object_instance: InteractableObject, action_name: String) -> void:
	if GameState.save_game.reception_elevator_open:
		ActionRelay.trigger("ElevatorDoorAnimation","play")
