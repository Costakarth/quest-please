extends Control

signal clicked

var button_blocked : bool = false

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton && !button_blocked:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				button_blocked = true
				SoundManager.play_button_sound()
				emit_signal("clicked")
				yield(get_tree().create_timer(.5), "timeout")
				button_blocked = false
