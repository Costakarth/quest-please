extends Node2D
class_name Character

var _type: CharacterType = null
var _name: String = "";

var _doorWaypoint: Vector2
var _deskWaypoint: Vector2
var _underWaypoint: Vector2

var quest : Quest

var max_timer : float = 0
var timer_started : bool = false

signal end_transition
signal wait_time_ended

func initialize(completeName: String, doorWay: Vector2, deskWay: Vector2, underWay: Vector2, max_timer : float):
	self._name = completeName;
	self._doorWaypoint = doorWay
	self._deskWaypoint = deskWay
	self._underWaypoint = underWay
	
	self.max_timer = max_timer
	
	$Name.text = completeName


func _ready():
	self.visible = false


func start_timer(seconds):
	$TextureProgress.max_value = seconds
	$Timer.start(seconds)
	timer_started = true
	$TextureProgress.visible = true
	
func _process(delta: float) -> void:
	if timer_started:
		var seconds_elapsed = max_timer - $Timer.time_left
		$TextureProgress.value = seconds_elapsed
	

func show_character() -> bool:
	if self.visible:
		return false;
	
	yield(get_tree().create_timer(0.5), "timeout");
	position = _doorWaypoint;
	scale = Vector2(.65, .65)
	self.visible = true;

	yield(get_tree().create_timer(0.5), "timeout");
	scale = Vector2(1, 1)
	position = _deskWaypoint;

	yield(get_tree().create_timer(0.5), "timeout")
	
	emit_signal("end_transition")
	return true

func hideCharacter() -> bool:
	if not self.visible:
		return false
	
	$TextureProgress.visible = false	
	$Timer.stop()
	

	yield(get_tree().create_timer(0.5), "timeout")
	scale = Vector2(.65, .65)
	
	position = _doorWaypoint;

	yield(get_tree().create_timer(0.5), "timeout");
	
	self.queue_free()
	return true
	

func drop_character() -> bool:
	if not self.visible:
		return false;

	yield(get_tree().create_timer(0.5), "timeout")
	scale = Vector2(.65, .65)
	
	position = _underWaypoint;

	yield(get_tree().create_timer(0.5), "timeout");
	
	self.queue_free()
	return true


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
	
	
func pick_quest(level : int) -> Quest:
	quest = QuestLoader.choose_quest_with_mix_max(level - 1, level)
	
	if Randomizer.get_random_integer(10) > 6:
		quest.has_error = true
	
	return quest


func _on_Timer_timeout() -> void:
	emit_signal("wait_time_ended")
