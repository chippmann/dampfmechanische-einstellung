extends Resource
class_name InteractableObjectAction

export var name: String
export var audio: AudioStream

export var conditionScript: Script

export var actionScript: Script
export var actionWaitsForAudio: bool = false
export var playerWalkBeforeAction: bool = true
