extends Reference
class_name WartungsschachtAction


func _execute(_action_name: String) -> void:
	print("not Open Wartungsschacht")
	#GameState.change_scene_to(GameState.Stage.ACT_1_Wartungsschacht)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
