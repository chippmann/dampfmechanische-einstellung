extends Resource

export var name: String
export var audio: AudioStream

export var condition: String

export var action: String


func is_condition_met() -> bool:
	var expression := Expression.new()
	expression.parse(condition)
	return expression.execute()


func execute_action() -> void:
	var expression := Expression.new()
	expression.parse(action)
	expression.execute()
