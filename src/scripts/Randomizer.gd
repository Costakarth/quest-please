extends Node

func _ready() -> void:
	randomize()
	

func get_random_integer(_max : int):
	return randi() % _max

