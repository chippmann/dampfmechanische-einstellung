extends InteractableObjectAction
class_name ObjectAction


func is_condition_met(action_name: String) -> bool:
	var condition_expression_result := true
	
	var condition_script_result := true
	if conditionScript:
		condition_script_result = conditionScript.new()._is_condition_met(action_name)
	
	return condition_expression_result && condition_script_result


func execute_action(interactable_object_instance: Node, action_name: String) -> void:
	if actionScript:
		actionScript.new()._execute(interactable_object_instance, action_name)


func restore_state(interactable_object_instance: Node, action_name: String) -> void:
	if actionScript:
		actionScript.new()._restore_state(interactable_object_instance, action_name)
