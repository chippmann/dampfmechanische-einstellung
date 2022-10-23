extends Reference
class_name BossAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	GameState.save_game.epilogue_talked = true
	if GameState.save_game.epilogue_wrenchgiven:
		GameState.change_scene_to(7)


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
