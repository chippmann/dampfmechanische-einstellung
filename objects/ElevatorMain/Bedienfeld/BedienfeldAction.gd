extends Reference
class_name BedienfeldAction


func _execute(_action_name: String) -> void:
	print("Open Bedienfeld")
	GameState.change_scene_to(GameState.Stage.ACT_1_Bedienfeld)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
