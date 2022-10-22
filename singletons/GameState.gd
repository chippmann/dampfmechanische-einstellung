extends Node

export var save_game: Resource = preload("res://savegame/SaveGame.tres")

enum Stage {
	PROLOGUE,
	ACT_1,
	EPILOGUE,
}


func _exit_tree() -> void:
	_save()


func change_scene_to(stage: int) -> void:
	save_game.current_stage = stage
	_save()
# warning-ignore:return_value_discarded
	get_tree().change_scene(_scene_path_from_stage(stage))


func save_game_exists() -> bool:
	return File.new().file_exists(save_game.save_game_path)


func _save() -> void:
# warning-ignore:return_value_discarded
	ResourceSaver.save(save_game.save_game_path, save_game)


func load_save_game() -> void:
	save_game = ResourceLoader.load(save_game.save_game_path, "", true)


func start_new_game() -> void:
	save_game = ResourceLoader.load("res://savegame/SaveGame.tres", "", true)


func _scene_path_from_stage(stage: int) -> String:
	match stage:
		GameState.Stage.PROLOGUE: return "res://stages/00_Prologue.tscn"
		GameState.Stage.ACT_1: return "res://stages/01_Act.tscn"
		GameState.Stage.EPILOGUE: return "res://stages/99_Epilogue.tscn"
		_: return "res://stages/00_Prologue.tscn"
