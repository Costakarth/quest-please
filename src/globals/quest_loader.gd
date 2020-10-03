extends Node

const Util = preload("res://src/scripts/commons/util.gd")

var quest_path = "res://src/entities/quests/"

	
func choose_quest(level : int) -> Quest:
	var quest_list = get_all_quests_until_level(level)
	var rand_index : int = Randomizer.get_random_integer(quest_list.size())
	
	return quest_list[rand_index]
	
	
func choose_quest_with_mix_max(min_level : int, max_level : int) -> Quest:
	var quest_list = get_all_quests_with_mix_max(min_level, max_level)
	var rand_index : int = Randomizer.get_random_integer(quest_list.size())
	
	return quest_list[rand_index]
	

func get_all_quests_until_level(level : int) -> Array:
	var quests_list = Util.load_resources_from_directory(quest_path)
	var restricted_quest_list = []
	for quest in quests_list:
		if quest.level <= level:
			restricted_quest_list.append(quest)
	return restricted_quest_list
	
func get_all_quests_with_mix_max(min_level : int, max_level : int) -> Array:
	var quests_list = Util.load_resources_from_directory(quest_path)
	var restricted_quest_list = []
	for quest in quests_list:
		if quest.level <= max_level && quest.level >= min_level:
			restricted_quest_list.append(quest)
	return restricted_quest_list
