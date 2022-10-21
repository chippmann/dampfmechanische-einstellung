extends TextureButton
class_name InteractableObject

# contains Action resources
export(Array, Resource) var actions: Array = []

onready var _audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var _is_action_executing := false

func on_press() -> void:
	if _is_action_executing: return
	_is_action_executing = true
	print("action start")
	
	var action := _provide_action()
	if action:
		print("Executing action: %s" % action.name)
		
		if action.audio:
			_audio_stream_player.set_stream(action.audio)
			_audio_stream_player.play()
			yield(_audio_stream_player, "finished")
		
		action.execute_action(action.name)
	
	_is_action_executing = false
	print("action end")

func _provide_action() -> Resource:
	for action in actions:
		if action.is_condition_met(action.name):
			return action
	return null
