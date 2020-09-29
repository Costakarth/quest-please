extends Node

const Util = preload("res://src/scripts/commons/util.gd")

var item_path = "res://src/entities/items/"

var items := []

func _init() -> void:
	items = Util.load_resources_from_directory(item_path)
	
