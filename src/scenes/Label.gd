extends Label




func _on_Label_mouse_entered() -> void:
	self.modulate = Color.red


func _on_Label_mouse_exited() -> void:
	self.modulate = Color.white
