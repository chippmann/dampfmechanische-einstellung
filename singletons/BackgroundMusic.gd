extends Node


func _ready() -> void:
	var audio_player := AudioStreamPlayer.new()
	audio_player.autoplay = true
	audio_player.stream = load("res://assets/audio/elevatormusic.mp3")
	audio_player.volume_db = -20
	add_child(audio_player)

