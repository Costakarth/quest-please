extends Node2D

export(int) var level = 1

onready var vbox = $PanelContainer/MarginContainer/VBoxContainer
onready var popup = $Popup
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_image = preload("res://src/scenes/TextureRect.tscn")
onready var CharacterManager = $CharacterManager;

func _ready() -> void:
	_populate_quest_board(level)
	CharacterManager.initialize($Waypoints/DoorWaypoint.position, $Waypoints/FrontDeskWaypoint.position)
	#generate_character()

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_F1:
			CharacterManager.create_character();
		if event.scancode == KEY_F2:
			CharacterManager.get_child(0).showCharacter();
	"""if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_A:
			character.showCharacter();
		elif event.scancode == KEY_B:
			character.hideCharacter();"""
	pass


func _populate_quest_board(level : int):
	for quest in QuestLoader.quests[level]:
		var quest_container_instance = quest_container.instance()
		quest_container_instance.quest = quest
		quest_container_instance.connect("clicked", popup, "_on_quest_clicked")
			
		vbox.add_child(quest_container_instance)
