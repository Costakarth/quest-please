extends Control

signal clicked

var audio_muted := false


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if audio_muted:
					$AudioMuted.visible = true
					$AudioNotMuted.visible = false
					AudioServer.set_bus_mute(0, false)
					audio_muted = false
				else:
					$AudioMuted.visible = false
					$AudioNotMuted.visible = true
					AudioServer.set_bus_mute(0, true)
					audio_muted = true
				
