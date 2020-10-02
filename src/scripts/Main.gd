extends Node2D

const Util = preload("res://src/scripts/commons/util.gd")

signal new_error
signal new_char_to_avoid

export(int) var level = 0
export(int) var max_level = 4

export(int) var characters_done = 0

export(int) var number_chars_new_reject = 6
export(int) var number_chars_new_level = 10
export var max_timer = 15
export(int) var error_qnty = 0
export(int) var max_error_qnty = 3
onready var quest_grid = $Monitor/Margin/ScrollContainer/VBoxContainer
onready var popup_manager = $PopupManager
onready var quest_container = preload("res://src/scenes/QuestBox.tscn")
onready var quest_item = preload("res://src/scenes/QuestItem.tscn")
onready var CharacterManager = $CharacterManager
onready var itemContainer = $ItemContainer

var character : Character = null
var character_type_to_reject : CharacterType = null

var accept_can_be_clicked = false
var reject_can_be_clicked = false

func _ready() -> void:
	randomize()
	_populate_quest_board(level)
	CharacterManager.initialize($Waypoints/DoorWaypoint.position, 
		$Waypoints/FrontDeskWaypoint.position,
		$Waypoints/UnderDeskWaypoint.position,
		max_timer)
	_new_char_to_avoid()
				

func _on_end_transition():
	character.start_timer(max_timer)
	var quest : Quest = character.quest
				
	var items = quest.items_required
	 
	var error_index
	
	if quest.has_error:
		error_index = randi() % items.size() + 1
		
	if character._type == character_type_to_reject:
		error_index = null
		quest.error = "NOT REJECTED"

	var index = 1
	for it in items:
		var item : Item = it
		var quest_item_instance = quest_item.instance()
		quest_item_instance.visible = false
		quest_item_instance.get_child(0).texture = item.texture
		if index == error_index:
			var item_state : ItemState = item.get_random_item_state_from_level(level)
			var texture : Texture = item_state.texture_array[randi() % item_state.texture_array.size()]
			quest_item_instance.get_child(1).texture = texture
			quest.error = item_state.ErrorType.keys()[item_state.error_type]
		else:
			quest_item_instance.get_child(1).texture = item.texture_detailed
		
		itemContainer.add_child(quest_item_instance)
		var position_name : String = "ItemPosition/ItemWaypoint" + String(index)
		quest_item_instance.position = get_node(position_name).position
		quest_item_instance.initial_position = get_node(position_name).position
		quest_item_instance.visible = true
		
		index = index + 1


func _populate_quest_board(level : int):
	Util.delete_children_from_node(quest_grid)
	for quest in QuestLoader.get_all_quests_until_level(level):
		var quest_container_instance = quest_container.instance()
		quest_container_instance.quest = quest
		quest_container_instance.connect("clicked", popup_manager, "_on_quest_clicked")
			
		quest_grid.add_child(quest_container_instance)


func _on_ButtonControl_clicked() -> void:
	if !character:
		SoundManager.play_open_door_sound()
		$BGDoorClose.visible = false
		character = CharacterManager.create_character()
		character.show_character()
		yield(get_tree().create_timer(0.5), "timeout")
		SoundManager.play_close_door_sound()
		$BGDoorClose.visible = true
		character.pick_quest(level)
		
		character.connect("end_transition", self, "_on_end_transition")
		character.connect("wait_time_ended", self, "_on_wait_time_ended")
		accept_can_be_clicked = true
		reject_can_be_clicked = true


func _on_AcceptButtonControl_clicked() -> void:
	if accept_can_be_clicked:
		accept_can_be_clicked = false
		if character.quest.has_error:
			_check_errors(character.quest)
		Util.delete_children_from_node(itemContainer)
		character.hideCharacter()
		SoundManager.play_open_door_sound()
		yield(get_tree().create_timer(0.5), "timeout")
		$BGDoorClose.visible = false
		yield(get_tree().create_timer(0.5), "timeout")
		SoundManager.play_close_door_sound()
		$BGDoorClose.visible = true
		_char_done()


func _on_RejectButtonControl_clicked() -> void:
	if reject_can_be_clicked:
		reject_can_be_clicked = false
		if !character.quest.has_error:
			_check_errors(character.quest)
		Util.delete_children_from_node(itemContainer)
		yield(get_tree().create_timer(0.5), "timeout")
		character.queue_free()
		_char_done()
	
	
func _on_wait_time_ended():
	var fake_quest : = Quest.new()
	fake_quest.has_error = 1
	fake_quest.error = "WAIT TIME ENDED"
	_check_errors(fake_quest)
	Util.delete_children_from_node(itemContainer)
	character.hideCharacter()
	SoundManager.play_open_door_sound()
	yield(get_tree().create_timer(0.5), "timeout")
	$BGDoorClose.visible = false
	SoundManager.play_close_door_sound()
	yield(get_tree().create_timer(0.5), "timeout")
	$BGDoorClose.visible = true
	_char_done()


func _char_done():
	characters_done = characters_done + 1
	if characters_done % number_chars_new_level == 0:
		if level > max_level:
			get_tree().change_scene("res://Intro.tscn")
		level = level + 1
		_populate_quest_board(level)
	if characters_done % number_chars_new_reject == 0:
		_new_char_to_avoid()


func _new_char_to_avoid():
	character_type_to_reject = CharacterLoader.get_character_type()
	emit_signal("new_char_to_avoid", character_type_to_reject)
	
func _check_errors(quest : Quest):
	error_qnty = error_qnty + 1
	emit_signal("new_error", quest)
	yield(get_tree().create_timer(0.5), "timeout")
	if error_qnty >= max_error_qnty:
		get_tree().change_scene("res://src/scenes/Outro.tscn")
