class_name Team
extends Node2D

var _money := 999
var money :
	get:
		return _money

func give_money(amount: int) -> int:
	assert(amount >= 0)
	_money += amount
	return _money
