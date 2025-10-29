class_name Building
extends Resource

@export var health: int
@export var name: String
@export var pattern: TileMapPattern

func _init(b_health = 0, b_name = "UNNAMED", b_pattern = null):
	health = b_health
	name = b_name
	pattern = b_pattern
