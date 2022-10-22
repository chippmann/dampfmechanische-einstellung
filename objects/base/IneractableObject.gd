extends TextureButton
class_name InteractableObject

# contains Action resources
export(Array, Resource) var actions: Array = []

onready var _audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func on_press() -> void:
	var action := _provide_action()
	if action:
		ActionRelay.try_execute_action(action, funcref(self, "_play_audio"), rect_global_position)


func _provide_action() -> Resource:
	for action in actions:
		if action.is_condition_met(action.name):
			return action
	return null


func _play_audio(action: Resource) -> void:
	if action.audio:
		_audio_stream_player.set_stream(action.audio)
		_audio_stream_player.play()
		if action.actionWaitsForAudio:
			yield(_audio_stream_player, "finished")
