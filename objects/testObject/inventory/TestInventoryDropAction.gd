extends InventoryDropAction
class_name TestInventoryDropAction


func _on_inventory_drop(_action_name: String, inventory_id: String, inventory_data: Dictionary) -> void:
	var item = Inventory.use_item(inventory_id)
	print("Used item %s" % item)
