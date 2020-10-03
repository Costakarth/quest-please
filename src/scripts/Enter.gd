extends Label

var index = 1

signal next_scene

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				get_node("../Control" + String(index)).visible = false
				index = index + 1
				
				if index > 8:
					emit_signal("next_scene")
					return
								
				get_node("../Control" + String(index)).visible = true

