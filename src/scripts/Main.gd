extends Node2D

export(int) var level = 1

onready var vbox = get_node("PanelContainer/MarginContainer/VBoxContainer")
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_image = preload("res://src/scenes/TextureRect.tscn")

func _ready() -> void:
	_populate_quest_board(level)


func _populate_quest_board(level : int):
	var index = 0
	for quest in QuestLoader.quests[level]:
		var quest_container_instance = quest_container.instance()
		quest_container_instance.get_child(0).text = quest.name
		for item in quest.items_required:
			var quest_image_instance = quest_image.instance()
			quest_image_instance.texture = item.texture
			quest_container_instance.add_child(quest_image_instance)
		vbox.add_child(quest_container_instance)
		vbox.get_child(index).visible = true
		index = index + 1
