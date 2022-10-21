extends Resource

export var name: String
export var audio: AudioStream

export var conditionExpression: String
export var conditionScript: Script

export var actionExpression: String
export var actionScript: Script


func is_condition_met() -> bool:
	var condition_expression_result := true
	if conditionExpression:
		var expression := Expression.new()
		expression.parse(conditionExpression)
		condition_expression_result = expression.execute([], self)
	
	var condition_script_result := true
	if conditionScript:
		condition_script_result = conditionScript.new()._is_condition_met()
	
	return condition_expression_result && condition_script_result


func execute_action() -> void:
	if actionExpression:
		var expression := Expression.new()
		expression.parse(actionExpression)
		expression.execute()
	
	if actionScript:
		actionScript.new()._execute()
