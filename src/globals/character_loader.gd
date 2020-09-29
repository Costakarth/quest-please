extends Node

const Util = preload("res://src/scripts/commons/util.gd")

var _load_path = "res://src/entities/characters/"

var _characters := []
var _characters_by_type := {}

func _init() -> void:
	_characters = Util.load_resources_from_directory(_load_path);
	_characters_by_type = _generate_by_type();
	pass

func get_character_type() -> CharacterType:
	randomize()
	return _characters[randi() % _characters.size()];

func get_character_by_class(classType) -> Character:
	randomize()
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
