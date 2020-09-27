extends Container

onready var label = $Label
var quest

signal clicked

func _ready() -> void:
	label.text = quest.name

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				emit_signal("clicked", quest)

