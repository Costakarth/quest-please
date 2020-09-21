extends Node

const json_path : String = "res://quest.json"

var quests : Dictionary
var rng = RandomNumberGenerator.new()


func _init() -> void:
	quests = _parse_quests_from_file()
	
	
func get_random_quest() -> Dictionary:
	rng.randomize()
	var keys = quests.keys()

	var quest = quests[randi() % keys.size()]

	return quest
	
	
func _parse_quests_from_file() -> Dictionary:
	var file = File.new()
	if file.open(json_path, File.READ) != OK:
		return {}
		
	var text_file = file.get_as_text()
	file.close()
	
	var json = JSON.parse(text_file)
	if json.error != OK:
		return {}
		
	return json.result



