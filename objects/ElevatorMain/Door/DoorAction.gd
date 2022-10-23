extends Reference
class_name DoorAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	match(_action_name):
		"Door30":
			GameState.change_scene_to(6)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
