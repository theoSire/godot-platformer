extends Node2D

@onready var collision_polygon_2D = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2D = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var level_completed = $CanvasLayer/LevelCompleted
func _ready():
	RenderingServer.set_default_clear_color(Color.FIREBRICK)
	polygon_2D.polygon = collision_polygon_2D.polygon
	Events.level_completed.connect(show_level_completed)

func show_level_completed():
	level_completed.show()
	get_tree().paused = true
