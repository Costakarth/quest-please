extends Node2D

export(int) var level = 1

onready var vbox = $PanelContainer/MarginContainer/VBoxContainer
onready var popup = $Popup
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_image = preload("res://src/scenes/TextureRect.tscn")

func _ready() -> void:
	_populate_quest_board(level)


func _populate_quest_board(level : int):
	var index = 0
	for quest in QuestLoader.quests[level]:
		var quest_container_instance = quest_container.instance()
		quest_container_instance.quest = quest
		quest_container_instance.connect("clicked", popup, "_on_quest_clicked")
			
		vbox.add_child(quest_container_instance)
		vbox.get_child(index).visible = true
		index = index + 1
