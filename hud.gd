extends Control

const MONEY_LABEL_FORMAT = "monye: {value}"

@export var money_giver: Button
@export var money_label: Label
@export var player_team: Team

func _ready() -> void:
	money_giver.pressed.connect(_update_label)

func _update_label():
	player_team.give_money(5)
	money_label.text = MONEY_LABEL_FORMAT.format({"value": player_team.money})
