extends Node


func trigger(group_name: String, methode_name: String, parameters: Array = []) -> void:
	for node in get_tree().get_nodes_in_group(group_name):
		node.callv(methode_name, parameters)
