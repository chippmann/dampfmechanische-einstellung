extends KinematicBody2D
class_name Player

export var movement_speed: int = 200
export var scaling_multiplier: float = 0.5

export var body: NodePath
onready var _body: Sprite = get_node(body)

var _velocity := Vector2.ZERO
var _starting_y_pos: float
var _starting_scale: Vector2 = Vector2(1.0, 1.0)

func _ready() -> void:
	var initial_player_pos: = GameState.get_init_player_position()
	if initial_player_pos != Vector2.ZERO:
		global_position = initial_player_pos
	
	_starting_y_pos = global_position.y
	_starting_scale = scale
# warning-ignore:return_value_discarded
	PlayerNavigationTarget.connect("new_player_navigation_target", self, "_on_new_player_target")
# warning-ignore:return_value_discarded
	PlayerNavigationTarget.connect("cancel_navigation", self, "_on_cancel_navigation")
	$NavigationAgent2D.set_target_location(global_position)


func _process(delta: float) -> void:
	var offset := global_position.y - _starting_y_pos
	var target_scale :=  _starting_scale + (Vector2(1, 1) * offset * scaling_multiplier * 0.001)
	scale = target_scale


func _physics_process(delta: float) -> void:
	if $NavigationAgent2D.is_navigation_finished(): return
	
	var direction := global_position.direction_to($NavigationAgent2D.get_next_location())
	
	var desired_velocity := direction * movement_speed
	var steering := (desired_velocity - _velocity) * delta * 4.0
	_velocity += steering
	_velocity = move_and_slide(_velocity)

func _on_new_player_target(new_target: Vector2) -> void:
	$AnimationPlayer.play("walking")
	var adjusted_target := new_target if new_target != null else global_position
	
	if new_target.x > global_position.x:
		adjusted_target.x -= _body.get_rect().size.x
	else:
		adjusted_target.x += _body.get_rect().size.x
	
	$NavigationAgent2D.set_target_location(adjusted_target)


func _on_NavigationAgent2D_navigation_finished() -> void:
	print("Player navigation finished")
	GameState.current_player_position = global_position
	$AnimationPlayer.stop()
	_velocity = Vector2.ZERO
	PlayerNavigationTarget.emit_signal("player_navigation_finished")

func _on_cancel_navigation() -> void:
	if !$NavigationAgent2D.is_navigation_finished():
		print("Player navigation cancelled")
		$NavigationAgent2D.set_target_location(global_position)
		PlayerNavigationTarget.emit_signal("player_navigation_cancelled")
	
