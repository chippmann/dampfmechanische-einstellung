extends KinematicBody2D
class_name Player

export var movement_speed: int = 200

export var body: NodePath
onready var _body: Sprite = get_node(body)

var _velocity := Vector2.ZERO

func _ready() -> void:
# warning-ignore:return_value_discarded
	PlayerNavigationTarget.connect("new_player_navigation_target", self, "_on_new_player_target")
# warning-ignore:return_value_discarded
	PlayerNavigationTarget.connect("cancel_navigation", self, "_on_cancel_navigation")
	$NavigationAgent2D.set_target_location(global_position)


func _physics_process(delta: float) -> void:
	if $NavigationAgent2D.is_navigation_finished(): return
	
	var direction := global_position.direction_to($NavigationAgent2D.get_next_location())
	
	var desired_velocity := direction * movement_speed
	var steering := (desired_velocity - _velocity) * delta * 4.0
	_velocity += steering
	_velocity = move_and_slide(_velocity)

func _on_new_player_target(new_target: Vector2) -> void:
	var adjusted_target := new_target if new_target != null else global_position
	
	if new_target.x > global_position.x:
		adjusted_target.x -= _body.get_rect().size.x
	else:
		adjusted_target.x += _body.get_rect().size.x
	
	$NavigationAgent2D.set_target_location(adjusted_target)


func _on_NavigationAgent2D_navigation_finished() -> void:
	print("Player navigation finished")
	_velocity + Vector2.ZERO
	PlayerNavigationTarget.emit_signal("player_navigation_finished")

func _on_cancel_navigation() -> void:
	if !$NavigationAgent2D.is_navigation_finished():
		print("Player navigation cancelled")
		$NavigationAgent2D.set_target_location(global_position)
		PlayerNavigationTarget.emit_signal("player_navigation_cancelled")
	
