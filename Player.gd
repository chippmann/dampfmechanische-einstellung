extends KinematicBody2D
class_name Player

export var movement_speed: int = 100

export var navigation: NodePath
onready var _navigation: Navigation2D = get_node(navigation)

var _velocity := Vector2.ZERO
var _current_action_instance_guid: String

func _ready() -> void:
	PlayerNavigationTarget.connect("new_player_navigation_target", self, "_on_new_player_target")


func _physics_process(delta: float) -> void:
	if $NavigationAgent2D.is_navigation_finished(): return
	
	var direction := global_position.direction_to($NavigationAgent2D.get_next_location())
	
	var desired_velocity := direction * movement_speed
	var steering := (desired_velocity - _velocity) * delta * 4.0
	_velocity += steering
	_velocity = move_and_slide(_velocity)

func _on_new_player_target(new_target: Vector2, action_instance_guid: String) -> void:
	_current_action_instance_guid = action_instance_guid
	if !$NavigationAgent2D.is_navigation_finished():
		PlayerNavigationTarget.emit_signal("player_navigation_cancelled", action_instance_guid)
		
	$NavigationAgent2D.set_target_location(new_target)


func _on_NavigationAgent2D_navigation_finished() -> void:
	print("Player navigation finished")
	PlayerNavigationTarget.emit_signal("player_navigation_finished", _current_action_instance_guid)
