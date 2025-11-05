extends Control

const MONEY_LABEL_FORMAT = "monye: {value}"
const BUILDING_INFO_FORMAT = "name: {name}\nhealth: {health}\npattern: {pattern}"

@export var money_giver: Button
@export var money_label: Label
@export var player_team: Team
@export var building_info_label: Label

func _ready() -> void:
	money_giver.pressed.connect(_on_giver_pressed)

	_update_label(player_team.gold_manager.amount)
	player_team.gold_manager.amount_changed.connect(_update_label)

	update_building_info(preload("res://resources/buildings/barracks.tres"))

func _on_giver_pressed() -> void:
	player_team.give_money(5)

func _update_label(value: int):
	money_label.text = MONEY_LABEL_FORMAT.format({"value": value})

func update_building_info(building: Building) -> void:
	building_info_label.text = BUILDING_INFO_FORMAT.format({
		"name": building.name,
		"health": building.health,
		"pattern": building.pattern,
	})
