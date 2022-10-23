extends Reference
class_name BedienfeldButtons229Action


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	match(_action_name):
		"BedienfeldButtons2-29_first":
			GameState.save_game.act01_bedienfeld_buttonpressedfirsttime = true
			ActionRelay.trigger("Buttons_2-29_1", "emit_signal", ["pressed"])
		"BedienfeldButtons2-29_notworking":
			pass
		"BedienfeldButtons2-29_working":
			GameState.save_game.act01_current_floor = 2
			ActionRelay.trigger("OuterRoomImage1", "set_visible", [false])
		"BedienfeldButtons30_first":
			GameState.save_game.act01_bedienfeld_buttonpressedfirsttime = true
			ActionRelay.trigger("Buttons_30", "emit_signal", ["pressed"])
		"BedienfeldButtons30_notworking":
			pass
		"BedienfeldButtons30_working":
			GameState.save_game.act01_current_floor = 30
			ActionRelay.trigger("OuterRoomImage1", "set_visible", [false])
			ActionRelay.trigger("OuterRoomImage2-29", "set_visible", [false])



func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	pass
