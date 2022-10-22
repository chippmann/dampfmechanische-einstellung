extends Reference
class_name DoorAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	print("Door Action")


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
