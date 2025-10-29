class_name Team
extends Node2D

@export var gold_manager: GoldManager

func give_money(amount: int) -> int:
	gold_manager.amount += amount
	return gold_manager.amount
