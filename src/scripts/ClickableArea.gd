extends Area2D

signal clicked
signal not_clicked


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				emit_signal("clicked")
			else:
				emit_signal("not_clicked")


func _on_ClickableArea_mouse_exited() -> void:
	emit_signal("not_clicked")
