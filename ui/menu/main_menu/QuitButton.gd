extends Button
class_name QuitButton


func _ready() -> void:
	visible = OS.has_feature("pc")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
