extends Reference
class_name TableauAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	GameState.change_scene_to(GameState.Stage.ACT_1_Tableau)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
