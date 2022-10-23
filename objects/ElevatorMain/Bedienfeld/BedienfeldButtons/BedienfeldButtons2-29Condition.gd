extends Reference
class_name BedienfeldButtons229Condition


func _is_condition_met(_action_name: String) -> bool:
	match(_action_name):
		"BedienfeldButtons1_first":
			return !GameState.save_game.act01_bedienfeld_buttonpressedfirsttime
		"BedienfeldButtons1_notworking":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& !GameState.save_game.act01_wartungsschacht_functional_pipe_placed
		"BedienfeldButtons1_working":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& GameState.save_game.act01_wartungsschacht_functional_pipe_placed
		"BedienfeldButtons2-29_first":
			return !GameState.save_game.act01_bedienfeld_buttonpressedfirsttime
		"BedienfeldButtons2-29_notworking":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& !GameState.save_game.act01_wartungsschacht_functional_pipe_placed
		"BedienfeldButtons2-29_working":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& GameState.save_game.act01_wartungsschacht_functional_pipe_placed
		"BedienfeldButtons30_first":
			return !GameState.save_game.act01_bedienfeld_buttonpressedfirsttime
		"BedienfeldButtons30_notworking":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& !GameState.save_game.act01_wartungsschacht_functional_pipe_placed
		"BedienfeldButtons30_working":
			return GameState.save_game.act01_bedienfeld_buttonpressedfirsttime \
			&& GameState.save_game.act01_wartungsschacht_functional_pipe_placed
	return false
