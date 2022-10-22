extends Resource
class_name GlobalInteractableObjectState

var currently_running_action: Resource
var currently_running_action_is_in_walking_state: bool = false

func _can_execute_action() -> bool:
	return currently_running_action == null || currently_running_action_is_in_walking_state == true
