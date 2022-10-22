extends Button
class_name NewGameButton



func _on_NewGameButton_pressed() -> void:
	GameState.start_new_game()
	GameState.change_scene_to(GameState.save_game.current_stage)
