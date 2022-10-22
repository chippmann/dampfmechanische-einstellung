extends Reference
class_name IntercomHandleAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	if GameState.save_game.act01_screwdriver_in_fuse:
		ActionRelay.trigger("IntercomInactive", "set_visible", [false])
		ActionRelay.trigger("IntercomConnecting", "set_visible", [false])
	else:
		ActionRelay.trigger("IntercomInactive", "set_visible", [false])
		#WIP: Timer 3s
		ActionRelay.trigger("IntercomInactive", "set_visible", [true])
		


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
