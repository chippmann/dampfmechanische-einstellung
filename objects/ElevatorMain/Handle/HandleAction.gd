extends Reference
class_name HandleAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	if Inventory.has_object("Pipe_Functional") || GameState.save_game.act01_wartungsschacht_functional_pipe_placed:
		ActionRelay.trigger("Pipe_Functional", "set_visible", [false])
