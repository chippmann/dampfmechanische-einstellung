extends Reference
class_name HandleAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	print("handle must be removed with a tool")


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
