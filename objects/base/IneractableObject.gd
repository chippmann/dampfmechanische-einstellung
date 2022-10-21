extends TextureButton
class_name InteractableObject

# contains Action resources
export(Array, Resource) var actions: Array = []

onready var _audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var currently_running_action_instances = {}

func _ready() -> void:
	PlayerNavigationTarget.connect("player_navigation_cancelled", self, "_on_player_navigation_cancelled")

func on_press() -> void:
	var mouse_position := get_global_mouse_position()
	if _is_action_executing(): return
	print("action start")
	
	var action := _provide_action()
	var action_instance_guid := Uuid.generate()
	
	if action:
		currently_running_action_instances[action_instance_guid] = action
		print("Executing action: %s" % action.name)
		
		if action.audio:
			_audio_stream_player.set_stream(action.audio)
			_audio_stream_player.play()
			if action.actionWaitsForAudio:
				yield(_audio_stream_player, "finished")
		
		if action.playerWalkBeforeAction:
			PlayerNavigationTarget.emit_signal("new_player_navigation_target", mouse_position, action_instance_guid)
			yield(PlayerNavigationTarget, "player_navigation_finished")
		
		if currently_running_action_instances.has(action_instance_guid):
			action.execute_action(action.name)
			print("Action %s finished" % action.name)
		else:
			print("Action cancelled: %s" % action.name)
	
	currently_running_action_instances.erase(action_instance_guid)

func _provide_action() -> Resource:
	for action in actions:
		if action.is_condition_met(action.name):
			return action
	return null


func _on_player_navigation_cancelled(action_instance_guid: String) -> void:
	print("got action_instance_guid %s" % action_instance_guid)
	if !currently_running_action_instances.has(action_instance_guid): return
	
	var action: Resource = currently_running_action_instances[action_instance_guid]
	if action.playerWalkBeforeAction:
		currently_running_action_instances.erase(action_instance_guid)


func _is_action_executing() -> bool:
	return !currently_running_action_instances.empty()
