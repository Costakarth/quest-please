extends Node2D

export(int) var level = 1

onready var quest_grid : GridContainer = $Monitor/Margin/QuestGrid
onready var popup = $Popup
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_image = preload("res://src/scenes/TextureRect.tscn")
onready var character = preload("res://src/scenes/Character.tscn")

func _ready() -> void:
	_populate_quest_board(level)
	#generate_character()

func generate_character():
	var generated = character.instance();
	generated.set_character(CharacterLoader.get_character_by_class(CharacterType.Type.NetRunner))
	CharacterLoader.get_node(".").add_child(generated)

func _populate_quest_board(level : int):
	for quest in QuestLoader.quests[level]:
		var quest_container_instance = quest_container.instance()
		quest_container_instance.quest = quest
		quest_container_instance.connect("clicked", popup, "_on_quest_clicked")
			
		quest_grid.add_child(quest_container_instance)
