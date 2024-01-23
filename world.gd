extends Node2D

@export var next_level: PackedScene

@onready var level_completed = $CanvasLayer/LevelCompleted
@onready var start_in = %StartIn
@onready var start_in_label = %CanvasLayer/StartIn/CenterContainer/StartInLabel
@onready var animation_player = $AnimationPlayer

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	Events.level_completed.connect(show_level_completed)
	get_tree().paused = true
	start_in.visible = true
	await LevelTransition.fade_from_black()
	animation_player.play("countdown")
	await animation_player.animation_finished
	start_in.visible = false
	get_tree().paused = false

func show_level_completed():
	get_tree().paused = true
	level_completed.show()
	if not next_level is PackedScene: return
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_packed(next_level)
	LevelTransition.fade_from_black()
