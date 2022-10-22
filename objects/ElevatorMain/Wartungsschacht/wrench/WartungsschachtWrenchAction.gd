extends Reference
class_name WartungsschachtWrenchAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	Inventory.add_item("Wrench", { "preview": "res://assets/texture/ElevatorMain/wrench.png" })
	ActionRelay.trigger("Wrench", "set_visible", [false])


func _restore_state(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	if Inventory.has_object("Wrench"):
		ActionRelay.trigger("Wrench", "set_visible", [false])
