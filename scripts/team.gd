class_name Team
extends Node2D

@export var gold_manager: GoldManager
@export var object_placer: ObjectPlacer

func give_money(amount: int) -> int:
	gold_manager.amount += amount
	return gold_manager.amount

func place_building(building: Building) -> void:
	if gold_manager.amount < building.cost:
		print("not enough money to place {bldg_name}".format({"bldg_name": building.name}))
		return
	gold_manager.amount -= building.cost
	
	
