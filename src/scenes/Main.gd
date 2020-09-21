extends Node2D


func _ready() -> void:
	choose_quest()


func choose_quest():
	print(QuestsLoader.get_random_quest())
