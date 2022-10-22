extends InteractableObjectAction
class_name InventoryAction


func can_handle_inventory_drop(action_name: String, inventory_id: String, inventory_data: Dictionary) -> bool:
	var condition_result := true
	
	if conditionScript:
		condition_result = conditionScript.new()._can_handle_inventory_drop(action_name, inventory_id, inventory_data)
	
	return condition_result


func on_inventory_drop(action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	if actionScript:
		actionScript.new()._on_inventory_drop(action_name, inventory_id, inventory_data)
