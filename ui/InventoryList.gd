extends HBoxContainer

export var inventory_item_packed_scene: PackedScene


func _ready() -> void:
	Inventory.connect("item_added", self, "_on_inventory_item_added")
	Inventory.connect("item_removed", self, "_on_inventory_item_removed")
	
	var inventory := Inventory.get_inventory()
	for key in inventory.keys():
		_add_item(key, inventory[key]["preview"])


func _add_item(inventory_id: String, preview_resource_path: String) -> void:
	var item_preview: Texture = load(preview_resource_path)
	var inventory_item: InventoryItem = inventory_item_packed_scene.instance()
	inventory_item.inventory_id = inventory_id
	inventory_item.inventory_preview = item_preview
	
	add_child(inventory_item)


func _on_inventory_item_added(inventory_id: String, data: Dictionary) -> void:
	_add_item(inventory_id, data["preview"])


func _on_inventory_item_removed(inventory_id: String) -> void:
	for child in get_children():
		if child is InventoryItem && child.inventory_id == inventory_id:
			child.queue_free()
