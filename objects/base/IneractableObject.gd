extends TextureButton
class_name InteractableObject

# contains Action resources
export(Array, Resource) var actions: Array = []
# contains InventoryAction resources
export(Array, Resource) var inventory_actions: Array = []

onready var _audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
onready var shader: ShaderMaterial = material


func _ready() -> void:
	GameState.connect("show_clickable_outline_changed", self, "_set_outline_color_alpha")
	_set_outline_color_alpha(GameState.show_clickable_outline)
	
	var action := _provide_action()
	if action:
		action.restore_state(self, action.name)


func on_press() -> void:
	var action := _provide_action()
	if action:
		ActionRelay.try_execute_action(action, funcref(self, "_play_audio"), funcref(self, "_execute_action"), rect_global_position)


# data = { "inventory_id": inventory_id }
func can_drop_data(_position: Vector2, data) -> bool:
	for inventory_action in inventory_actions:
		var inventory_id: String = data["inventory_id"]
		if inventory_action.can_handle_inventory_drop(inventory_action.name, inventory_id, Inventory.get_item(inventory_id)):
			return true
	return false


# data = { "inventory_id": inventory_id }
func drop_data(_position: Vector2, data)  -> void:
	for inventory_action in inventory_actions:
		var inventory_id: String = data["inventory_id"]
		if inventory_action.can_handle_inventory_drop(inventory_action.name, inventory_id, Inventory.get_item(inventory_id)):
			ActionRelay.try_execute_action(inventory_action, funcref(self, "_play_audio"), funcref(self, "_execute_action"), rect_global_position, [inventory_id, Inventory.get_item(inventory_id)])


func _provide_action() -> ObjectAction:
	for action in actions:
		if action.is_condition_met(action.name):
			return action
	return null


func _play_audio(action: InteractableObjectAction) -> void:
	if action.audio:
		_audio_stream_player.set_stream(action.audio)
		_audio_stream_player.play()
		if action.actionWaitsForAudio:
			yield(_audio_stream_player, "finished")


func _execute_action(action: InteractableObjectAction, user_data: Array) -> void:
	if action is ObjectAction: action.execute_action(action.name)
	var argument_array = [action.name]
	
	for data in user_data:
		argument_array.append(data)
	
	if action is InventoryAction: action.callv("on_inventory_drop", argument_array)


func _set_outline_color_alpha(new_value: bool) -> void:
	var current_coutline_color: Color = shader.get_shader_param("outline_color")
	current_coutline_color.a = 1 if new_value else 0
	shader.set_shader_param("outline_color", current_coutline_color)
