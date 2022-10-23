extends Reference
class_name Pipe_Defect_Action


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	if Inventory.has_object("Pipe_Defect"):
		ActionRelay.trigger("Pipe_Defect", "set_visible", [false])
	else:
		ActionRelay.trigger("Pipe_Defect", "set_visible", [true])
