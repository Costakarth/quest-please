extends MarginContainer

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				$VBoxContainer/Text.visible = false
				$VBoxContainer/Text2.visible = true



