extends Reference
class_name IntercomAction


func _execute(_action_name: String) -> void:
	print("Open Intercom")
	GameState.change_scene_to(GameState.Stage.ACT_1_Intercom)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
