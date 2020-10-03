extends Control

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				$ColorRect/Tween.interpolate_property($BlackScreen, "modulate:a", 
				0, 1, 1.0, 
				Tween.TRANS_LINEAR, Tween.EASE_IN)
	
				$ColorRect/Tween.start()


func _on_Tween_tween_all_completed() -> void:
	get_tree().change_scene("res://src/scenes/Intro.tscn")
