extends Action
class_name TestAction


func _execute(_interactable_object_instance: InteractableObject, _action_name: String) -> void:
	print("Adding light_bulb to inventory")
	Inventory.add_item("light_bulb", { "preview": "res://assets/texture/Reception/CeilingLight.png" })
