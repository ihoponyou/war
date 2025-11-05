class_name ObjectPlacer
extends Node2D

const HIGHLIGHT_ATLAS_COORDS := Vector2i(0,2)
const HIGHLIGHT_SOURCE_ID := 2

@export var preview_layer: TileMapLayer
@export var object_layer: TileMapLayer
@export var selected_building: Building
var last_hovered_cell: Vector2i = Vector2i.MIN
var _last_hovered_cells: Array[Vector2i] = []

func place_pattern(cell: Vector2i, building_pattern: TileMapPattern) -> void:
	for used_cell in building_pattern.get_used_cells():
		var mapped_cell := object_layer.map_pattern(cell, used_cell, building_pattern)
		var tile_data := object_layer.get_cell_tile_data(mapped_cell)
		if tile_data == null:
			continue
		print("cannot place here; {0} has something on it".format([mapped_cell]))
		return

	print("good to go")
	object_layer.set_pattern(cell, building_pattern)

func _process(_delta: float) -> void:
	var hovered_cell := preview_layer.local_to_map(preview_layer.get_local_mouse_position())
	var selected_pattern := selected_building.pattern

	var new_used_cells: Array[Vector2i] = []
	for used_cell in selected_pattern.get_used_cells():
		var mapped_cell := object_layer.map_pattern(hovered_cell, used_cell, selected_pattern)
		new_used_cells.append(mapped_cell)
		if mapped_cell in _last_hovered_cells:
			continue
		preview_layer.set_cell(hovered_cell, HIGHLIGHT_SOURCE_ID, HIGHLIGHT_ATLAS_COORDS)
	
	for old_used_cell in _last_hovered_cells:
		if not old_used_cell in new_used_cells:
			preview_layer.erase_cell(old_used_cell)
	_last_hovered_cells = new_used_cells


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("select"):
		return

	var selected_pattern = selected_building.pattern
	var clicked_cell := object_layer.local_to_map(object_layer.get_local_mouse_position())
	place_pattern(clicked_cell, selected_pattern)
