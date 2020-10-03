extends ColorRect

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				$Tween.interpolate_property(self, "modulate:a", 
				0, 1, 1.0, 
				Tween.TRANS_LINEAR, Tween.EASE_IN)
	
				$Tween.start()


func _on_Tween_tween_all_completed() -> void:
	get_tree().change_scene("res://src/scenes/Intro.tscn")
