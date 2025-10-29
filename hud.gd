extends Control

const MONEY_LABEL_FORMAT = "monye: {value}"

@export var money_giver: Button
@export var money_label: Label
@export var player_team: Team

func _ready() -> void:
	money_giver.pressed.connect(_on_giver_pressed)

	_update_label(player_team.gold_manager.amount)
	player_team.gold_manager.amount_changed.connect(_update_label)

func _on_giver_pressed() -> void:
	player_team.give_money(5)

func _update_label(value: int):
	money_label.text = MONEY_LABEL_FORMAT.format({"value": value})
