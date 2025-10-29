@tool
extends EditorScript

const PATTERNS_DIR := "res://resources/patterns"

var tile_set: TileSet = preload("res://resources/tile_set.tres")

func _run() -> void:
	print("attempting to save {count} pattern(s)".format({"count":tile_set.get_patterns_count()}))
	for i in tile_set.get_patterns_count():
		var pattern := tile_set.get_pattern(i)
		var filepath := "{dir}/{name}.tres".format({"dir": PATTERNS_DIR, "name": i})
		var result := ResourceSaver.save(pattern, filepath)
		if result != OK:
			print("failed to save pattern {idx}".format({"idx": i}))
			error_string(result)
			continue
		print("saved pattern %d @ %s" % [i, filepath])


