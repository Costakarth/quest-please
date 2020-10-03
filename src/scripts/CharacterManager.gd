extends Node

onready var characterScene = preload("res://src/scenes/Character.tscn");

var _doorWaypoint: Vector2
var _deskWaypoint: Vector2
var _underWaypoint: Vector2
var _max_timer


func initialize(doorWay: Vector2, deskWay: Vector2, underWay : Vector2, max_timer):
	self._doorWaypoint = doorWay
	self._deskWaypoint = deskWay
	self._underWaypoint = underWay
	self._max_timer = max_timer

# Creates a random Character Node (uses @CharacterLoader)
func create_character() -> Character:
	var character = characterScene.instance()
	character.initialize(_generate_name(), _doorWaypoint, _deskWaypoint, _underWaypoint, _max_timer)

	var rand = CharacterLoader.get_character_type()
	character.set_character(rand)
	
	self.add_child(character);
	return character

func _generate_name() -> String:
	var names := ["Everett", "London", "Bruno", "Oz", "Marten", "Havana", "Paris", "Kellen", "Korrad", "Derrik", "Ethan", "Morgoth", "Everett", "Stavros","Avery", "Stefan", "Zayne", "Baen", "Pascal", "Encelo", "Ciruzz", "Urien", "Jordan"]
	var surnames := ["Scofield", "Karbb", "Fahien", "Kerensky", "TheYellow", "Steward", "CrystalBit", "Burcham", "Helsing", "HunterMan", "Calder", "Tyrrell", "Wintermute", "Nylund", "Dowe", "Smith", "Mattix", "Tindal", "Konicek", "Albach"]
	
	return names[Randomizer.get_random_integer(names.size())] + ' ' + surnames[Randomizer.get_random_integer(surnames.size())]

	
