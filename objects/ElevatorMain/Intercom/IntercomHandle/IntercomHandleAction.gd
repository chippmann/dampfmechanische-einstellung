extends Reference
class_name IntercomHandleAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	match(_action_name):
		"IntercomHandle":
			ActionRelay.trigger("IntercomInactive", "set_visible", [false])
			yield(_interactable_object_instance.get_tree().create_timer(3.0), "timeout")
			ActionRelay.trigger("IntercomInactive", "set_visible", [true])
		"IntercomHandleUeberladen":
			ActionRelay.trigger("IntercomInactive", "set_visible", [false])
			yield(_interactable_object_instance.get_tree().create_timer(3.0), "timeout")
			ActionRelay.trigger("IntercomConnecting", "set_visible", [false])
			GameState.save_game.act01_wartungsschacht_offen = true
	return false


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
