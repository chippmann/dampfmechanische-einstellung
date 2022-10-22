extends Action
class_name receptionBellAction


func _execute(_action_name) -> void:
	GameState.save_game.reception_bell_count += 1
	ActionRelay.trigger("Receptionist", "emit_signal", ["pressed"])
