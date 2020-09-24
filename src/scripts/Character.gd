extends Node2D
class_name Character

var type: CharacterType = null

func _ready():
	self.translate(Vector2(0, 500))

func _process(delta):
	self.translate(Vector2(1, 0))

func set_character(newType) -> bool:
	if type == newType:
		return false
	type = newType
	$Sprite.texture = newType.texture
	$Name.text = newType.name
	return true;

func get_name() -> String:
	if type == null:
		return "Unassigned"
	return type.name;
