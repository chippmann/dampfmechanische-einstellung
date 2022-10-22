extends Reference
class_name Action


func _execute(_action_name: String) -> void:
	print("WARNING: no action defined. No op")


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
