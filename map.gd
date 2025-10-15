extends TileMapLayer

@export var collidable_tilemap_layers: Array[TileMapLayer] = []

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	for tilemap_layer in collidable_tilemap_layers:
		if coords in tilemap_layer.get_used_cells():
			return true
	return false

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	for tilemap_layer in collidable_tilemap_layers:
		if coords in tilemap_layer.get_used_cells():
			tile_data.set_navigation_polygon(0, null)
