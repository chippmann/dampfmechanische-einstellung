extends Reference
class_name BedienfeldButtons229Action


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	match(_action_name):
		"BedienfeldButtons2-29_first":
			GameState.save_game.act01_bedienfeld_buttonpressedfirsttime = true
		"BedienfeldButtons2-29_notworking":
			pass
		"BedienfeldButtons2-29_working":
			print("change floor")


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
