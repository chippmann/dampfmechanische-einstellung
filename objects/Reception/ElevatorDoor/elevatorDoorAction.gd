extends Reference
class_name elevatorDoorAction


func _execute(action_name: String) -> void:
	match(action_name):
		"ElevatorDoorPush03":
			GameState.receptionElevatorOpen = true
		"ElevatorDoorPush04":
			print("Victory!! Forward to Act01.")
	
