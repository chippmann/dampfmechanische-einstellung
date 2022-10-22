extends TextureButton
class_name InventoryItem

export var inventory_id: String
export var inventory_preview: Texture

func _ready() -> void:
	texture_normal = inventory_preview
	rect_min_size = Vector2(64, 64)

func get_drag_data(_position: Vector2):
	var texture_rect = TextureRect.new()
	texture_rect.texture = inventory_preview
	texture_rect.expand = true
	texture_rect.rect_min_size = Vector2(64, 64)
	set_drag_preview(texture_rect)
	return { "inventory_id": inventory_id }
