extends Action
class_name ScrewDriverAction


func _execute(action_name: String) -> void:
	Inventory.add_item("ScrewDriver")
	ActionRelay.trigger("ScrewDriver", "queue_free")
