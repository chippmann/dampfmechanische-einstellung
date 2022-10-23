extends Node


var arrow: Texture = load("res://assets/texture/UiElement/cursor.png")
var pointing_hand: Texture = load("res://assets/texture/UiElement/cursor_hand.png")


func _ready() -> void:
	Input.set_custom_mouse_cursor(arrow)
	Input.set_custom_mouse_cursor(pointing_hand, Input.CURSOR_POINTING_HAND, Vector2(21, 4))
	Input.set_custom_mouse_cursor(pointing_hand, Input.CURSOR_CAN_DROP, Vector2(21, 4))
