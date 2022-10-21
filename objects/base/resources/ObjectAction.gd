extends Resource

export var name: String
export var audio: AudioStream

export var conditionExpression: String
export var conditionScript: Script

export var actionExpression: String
export var actionScript: Script
export var actionWaitsForAudio: bool = true
export var playerWalkBeforeAction: bool = true


func is_condition_met(action_name: String) -> bool:
	var condition_expression_result := true
	if conditionExpression:
		var expression := Expression.new()
		assert(expression.parse(conditionExpression) == OK, "Could not parse expression")
		condition_expression_result = expression.execute([], self)
	
	var condition_script_result := true
	if conditionScript:
		condition_script_result = conditionScript.new()._is_condition_met(action_name)
	
	return condition_expression_result && condition_script_result


func execute_action(action_name: String) -> void:
	if actionExpression:
		var expression := Expression.new()
		assert(expression.parse(actionExpression) == OK, "Could not parse expression")
		expression.execute()
	
	if actionScript:
		actionScript.new()._execute(action_name)
