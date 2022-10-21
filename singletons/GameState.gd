extends Node

var receptionBellCount = 0
var receptionElevatorButtonPressed = false
var receptionElevatorOpen = false


func change_scene_to(scene_path: String) -> void:
	get_tree().change_scene(scene_path)
