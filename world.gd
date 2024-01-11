extends Node2D

@onready var collisionPolygon2D = $StaticBody2D/CollisionPolygon2D
@onready var polygon2D = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	RenderingServer.set_default_clear_color(Color.FIREBRICK)
	polygon2D.polygon = collisionPolygon2D.polygon
