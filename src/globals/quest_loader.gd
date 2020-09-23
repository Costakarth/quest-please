extends Node

var quest_path = "res://src/entities/quests/"
var item_path = "res://src/entities/items/"

var quests = {}
var items = []

func _init() -> void:
	var quests_list = _load_resources_from_dir(quest_path)
	_elaborate_quests(quests_list)
	items = _load_resources_from_dir(item_path)
	
	
func choose_quest(level : int) -> Quest:
	randomize()
	var rand_index : int = randi() % quests[level].size()
	
	return quests[level][rand_index]
	
	
func _elaborate_quests(quest_list):
	for quest in quest_list:
		if quests.has(quest.level):
			quests[quest.level].append(quest)
		else:
			quests[quest.level] = [quest]


func _load_resources_from_dir(path):
	var quests = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			quests.append(load(path + "/" + file))

	dir.list_dir_end()

	return quests
