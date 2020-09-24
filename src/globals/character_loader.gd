extends Node

var _load_path = "res://src/entities/characters/"

var _characters := []
var _characters_by_type := {}

func _init() -> void:
	_characters = _load_characters(_load_path);
	_characters_by_type = _generate_by_type();
	pass
	
func get_character_by_class(classType) -> Character:
	if not _characters_by_type.has(classType):
		return null
	return _characters[randi() % _characters_by_type[classType].size()];

func _generate_by_type() -> Dictionary:
	var result := {}
	for character in _characters:
		if result.has(character.type):  
			result[character.type].append(character)
		else:
			result[character.type] = [character]
	return result

func _load_characters(path: String) -> Array:
	var result = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			result.append(load(path + "/" + file))

	dir.list_dir_end()

	return result
