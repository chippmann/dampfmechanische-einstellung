extends Action
class_name receptionBellAction


func _execute(_action_name) -> void:
	GameState.receptionBellCount += 1
	ActionRelay.trigger("Receptionist", "emit_signal", ["pressed"])
