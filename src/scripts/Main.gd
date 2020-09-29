extends Node2D

const Util = preload("res://src/scripts/commons/util.gd")

export(int) var level = 1

onready var quest_grid : GridContainer = $Monitor/Margin/QuestGrid
onready var popup_manager = $PopupManager
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_item = preload("res://src/scenes/QuestItem.tscn")
onready var CharacterManager = $CharacterManager
onready var itemContainer = $ItemContainer

var character : Character = null

func _ready() -> void:
	randomize()
	_populate_quest_board(level)
	CharacterManager.initialize($Waypoints/DoorWaypoint.position, 
		$Waypoints/FrontDeskWaypoint.position,
		$Waypoints/UnderDeskWaypoint.position)
				

func _on_end_transition():
	var quest : Quest = character.quest
				
	var items = quest.items_required
	 
	var error_index
	
	if quest.has_error:
		error_index = randi() % items.size() +1

	var index = 1
	for item in items:
		var quest_item_instance = quest_item.instance()
		quest_item_instance.visible = false
		quest_item_instance.get_child(0).texture = item.texture
		if index == error_index:
			quest_item_instance.get_child(1).texture = item.texture_worn
			quest.error = "The object was deteriorated."
		else:
			quest_item_instance.get_child(1).texture = item.texture_detailed
		
		itemContainer.add_child(quest_item_instance)
		var position_name : String = "ItemPosition/ItemWaypoint" + String(index)
		quest_item_instance.position = get_node(position_name).position
		quest_item_instance.initial_position = get_node(position_name).position
		quest_item_instance.visible = true
		
		index = index + 1


func _populate_quest_board(level : int):
	for quest in QuestLoader.quests[level]:
		var quest_container_instance = quest_container.instance()
		quest_container_instance.quest = quest
		quest_container_instance.connect("clicked", popup_manager, "_on_quest_clicked")
			
		quest_grid.add_child(quest_container_instance)


func _on_ButtonControl_clicked() -> void:
	if !character:
		$BGDoorClose.visible = false
		character = CharacterManager.create_character()
		character.show_character()
		yield(get_tree().create_timer(0.5), "timeout")
		$BGDoorClose.visible = true
		character.pick_quest(level)

		character.connect("end_transition", self, "_on_end_transition")


func _on_AcceptButtonControl_clicked() -> void:
	if (character.quest.has_error):
		SceneManager.losing_reason = character.quest.error
		get_tree().change_scene("res://Outro.tscn")
	Util.delete_children_from_node(itemContainer)
	character.hideCharacter()
	yield(get_tree().create_timer(0.5), "timeout")
	$BGDoorClose.visible = false
	yield(get_tree().create_timer(0.5), "timeout")
	$BGDoorClose.visible = true
	

func _on_RejectButtonControl_clicked() -> void:
	if !character.quest.has_error:
		SceneManager.losing_reason = character.quest.error
		get_tree().change_scene("res://Outro.tscn")
	Util.delete_children_from_node(itemContainer)
	character.drop_character()
	yield(get_tree().create_timer(0.5), "timeout")
	character.queue_free()
