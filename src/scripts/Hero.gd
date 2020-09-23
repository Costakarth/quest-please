extends Node2D

onready var quest_item = preload("res://src/scenes/QuestItem.tscn")


func _ready() -> void:
	_pick_quest(1)
	
	
func _pick_quest(level: int):
	var quest : Quest = QuestLoader.choose_quest(level)

	var items = quest.items_required
	
	var index = 0
	for item in items:
		var quest_item_instance = quest_item.instance()
		quest_item_instance.get_child(0).texture = item.texture
		quest_item_instance.get_child(1).texture = item.texture
		$PG/Pos.add_child(quest_item_instance)
		quest_item_instance.position.x = quest_item_instance.position.x + (150 * index)
		
		index = index + 1
