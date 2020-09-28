extends Node

onready var characterScene = preload("res://src/scenes/Character.tscn");

var _characters := [];

var _doorWaypoint: Vector2;
var _deskWaypoint: Vector2;

func initialize(doorWay: Vector2, deskWay: Vector2):
	self._doorWaypoint = doorWay
	self._deskWaypoint = deskWay
	pass


# Creates a random Character Node (uses @CharacterLoader)
func create_character() -> bool:
	var character = characterScene.instance();
	character.initialize(_generate_name(), _doorWaypoint, _deskWaypoint);

	var rand = CharacterLoader.get_character_type();
	character.set_character(rand);

	_characters.push_back(character);

	self.add_child(character);
	return true

func _generate_name() -> String:
	var names := ["Everett", "London", "Oz", "Marten", "Paris", "Kellen", "Derrik", "Ethan", "Everett", "Avery", "Stefan", "Zayne", "Baen", "Pascal", "Encelo"]
	var surnames := ["Scofield", "Kerensky", "Steward", "Burcham", "Helsing", "Calder", "Tyrrell", "Nylund", "Dowe", "Smith", "Mattix", "Tindal", "Konicek"]
	
	return names[randi() % names.size()] + ' ' + surnames[randi() % surnames.size()]
	
