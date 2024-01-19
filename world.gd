extends Node2D

@export var next_level: PackedScene

@onready var level_completed = $CanvasLayer/LevelCompleted
func _ready():
	RenderingServer.set_default_clear_color(Color.FIREBRICK)
	Events.level_completed.connect(show_level_completed)

func show_level_completed():
	level_completed.show()
	get_tree().paused = true
	await LevelTransition.fade_to_black()
	if not next_level is PackedScene: return
	get_tree().paused = false
	get_tree().change_scene_to_packed(next_level)
	LevelTransition.fade_from_black()
