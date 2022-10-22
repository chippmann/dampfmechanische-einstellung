extends Button
class_name ContinueButton


func _ready() -> void:
	visible = GameState.save_game_exists()


func _on_ContinueButton_pressed() -> void:
	GameState.load_save_game()
	GameState.change_scene_to(GameState.save_game.current_stage)
