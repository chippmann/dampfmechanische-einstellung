extends Reference
class_name BedienfeldButtonsOpenCloseAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	match(_action_name):
		"BedienfeldButtonOpen":
			GameState.change_scene_to(1)
			yield(_interactable_object_instance.get_tree().create_timer(0.5), "timeout")
			ActionRelay.trigger("ElevatorDoorAnimation", "play", ["default", true])
			GameState.save_game.act01_door_open = true
			pass
		"BedienfeldButtonClose":
			GameState.change_scene_to(1)
			yield(_interactable_object_instance.get_tree().create_timer(0.5), "timeout")
			ActionRelay.trigger("ElevatorDoorAnimation", "play", ["default"])
			GameState.save_game.act01_door_open = false
			pass
		"BedienfeldButtonOpenAlready":
			pass
		"BedienfeldButtonCloseAlready":
			pass


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
