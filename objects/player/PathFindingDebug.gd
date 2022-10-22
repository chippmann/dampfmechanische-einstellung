extends Node2D

func _ready() -> void:
	set_as_toplevel(true)
	global_position = Vector2.ZERO

func _process(delta: float) -> void:
	if get_tree().debug_navigation_hint:
		update()

func _draw() -> void:
	var nav_path = get_parent().get_nav_path()
	for index in nav_path.size():
		var previous = nav_path[index - 1] if index != 0 else null
		if previous != null:
			var current = nav_path[index]
			draw_line(previous, current, Color.green)
