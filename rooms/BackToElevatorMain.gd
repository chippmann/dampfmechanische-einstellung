extends TextureButton



func _on_TextureButton_pressed() -> void:
	GameState.change_scene_to(GameState.Stage.ACT_1)
