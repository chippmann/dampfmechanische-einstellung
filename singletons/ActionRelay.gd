extends Node

var _currently_running_action: Resource = null
var _is_in_navigation_state: bool = false

signal _cancelled_action_returned

func _ready() -> void:
	PlayerNavigationTarget.connect("player_navigation_cancelled", self, "_on_player_navigation_cancelled")

func reset() -> void:
	_currently_running_action = null
	_is_in_navigation_state = false

func try_execute_action(
		action: InteractableObjectAction,
		play_audio: FuncRef,
		execute_action: FuncRef,
		action_position: Vector2,
		user_data: Array = []
) -> void:
	if _currently_running_action != null && !_is_in_navigation_state:
		print("Cannot execute action %s. Action %s is already running and not in navigation state" % [action.name, _currently_running_action.name])
		return
	
	if _currently_running_action != null && _is_in_navigation_state:
		print("Action %s is currently running and in navigation state. Cancelling it in order to execute action %s" % [_currently_running_action.name, action.name])
		PlayerNavigationTarget.emit_signal("cancel_navigation")
		yield(self, "_cancelled_action_returned")
	
	print("Executing action %s" % action.name)
	_currently_running_action = action
	
	if action.playerWalkBeforeAction:
		_is_in_navigation_state = true
		PlayerNavigationTarget.emit_signal("new_player_navigation_target", action_position)
		yield(PlayerNavigationTarget, "player_navigation_finished")
		
		if _currently_running_action == null:
			print("Action %s was cancelled. Will not continue..." % action.name)
			emit_signal("_cancelled_action_returned")
			return
		
		_is_in_navigation_state = false
	
	var play_audio_continuation = play_audio.call_func(action)
	if play_audio_continuation:
		yield(play_audio_continuation, "completed")
	
	# resetting before actually executing the action to be able to trigger other actions from this action
	_currently_running_action = null
	_is_in_navigation_state = false
	
	var execute_action_continuation = execute_action.call_func(action, user_data)
	if execute_action_continuation:
		yield(execute_action_continuation, "completed")


func trigger(group_name: String, methode_name: String, parameters: Array = []) -> void:
	for node in get_tree().get_nodes_in_group(group_name):
		node.callv(methode_name, parameters)


func _on_player_navigation_cancelled() -> void:
	_currently_running_action = null
	_is_in_navigation_state = false


func _on_player_navigation_finished() -> void:
	_is_in_navigation_state = false
