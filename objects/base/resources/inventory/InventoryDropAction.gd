extends Reference
class_name InventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	print("WARNING: no inventory drop action defined. No op")
