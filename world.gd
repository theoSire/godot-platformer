extends Node2D

@onready var collision_polygon_2D = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2D = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	RenderingServer.set_default_clear_color(Color.FIREBRICK)
	polygon_2D.polygon = collision_polygon_2D.polygon
