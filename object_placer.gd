extends Node2D

@export var selected_pattern: TileMapPattern
@export var object_layer: TileMapLayer

func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("select"):
		return

	selected_pattern = object_layer.tile_set.get_pattern(0)

	var clicked_cell := object_layer.local_to_map(object_layer.get_local_mouse_position())
	for used_cell in selected_pattern.get_used_cells():
		var mapped_cell := object_layer.map_pattern(clicked_cell, used_cell, selected_pattern)
		var tile_data := object_layer.get_cell_tile_data(mapped_cell)
		if tile_data == null:
			continue
		print("cannot place here; {0} has something on it".format([mapped_cell]))
		return

	print("good to go")
	object_layer.set_pattern(clicked_cell, selected_pattern)
