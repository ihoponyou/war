class_name GoldManager
extends Node2D

signal amount_changed(new_amount: int)

var _amount := 0
var amount :
	get: return _amount
	set(value): _set_amount(value)


func _set_amount(value: int) -> void:
	if value < 0:
		return
	_amount = value
	amount_changed.emit(value)

