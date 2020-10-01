extends Node

const Util = preload("res://src/scripts/commons/util.gd")

var quest_path = "res://src/entities/quests/"

var quests := {}


func _init() -> void:
	var quests_list = Util.load_resources_from_directory(quest_path)
	_elaborate_quests(quests_list)
	
	
func choose_quest(level : int) -> Quest:
	var rand_index : int = randi() % quests[level].size()
	
	return quests[level][rand_index]
	
	
func _elaborate_quests(quest_list : Array):
	for quest in quest_list:
		if quests.has(quest.level):
			quests[quest.level].append(quest)
		else:
			quests[quest.level] = [quest]
