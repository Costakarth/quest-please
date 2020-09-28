extends Node2D
class_name Character

var _type: CharacterType = null
var _name: String = "";

var _doorWaypoint: Vector2;
var _deskWaypoint: Vector2;

func initialize(completeName: String, doorWay: Vector2, deskWay: Vector2):
	self._name = completeName;
	self._doorWaypoint = doorWay
	self._deskWaypoint = deskWay
	
	$Name.text = completeName
	pass

func _ready():
	self.visible = false;
	pass

func showCharacter() -> bool:
	if self.visible:
		return false;
	
	yield(get_tree().create_timer(0.5), "timeout");
	position = _doorWaypoint;
	self.visible = true;

	yield(get_tree().create_timer(0.5), "timeout");
	position = _deskWaypoint;

	yield(get_tree().create_timer(0.5), "timeout");
	return true;

func hideCharacter() -> bool:
	if not self.visible:
		return false;

	yield(get_tree().create_timer(0.5), "timeout");
	position = _doorWaypoint;

	yield(get_tree().create_timer(0.5), "timeout");
	self.visible = false;
	
	return true;

func set_character(newType) -> bool:
	if _type == newType:
		return false
	_type = newType
	$Sprite.texture = newType.texture
	return true;

func get_name() -> String:
	if _type == null:
		# Should never happen
		return "Unassigned"
	return _name;
