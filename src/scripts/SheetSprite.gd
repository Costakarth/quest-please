extends Sprite

var second_counter : float = 0
var selected : bool = false

func _process(delta : float) -> void:
	if selected:
		second_counter += delta
		var uniform_periodic = abs(cos(second_counter * 3))
		
		self.material.set_shader_param("alpha", uniform_periodic)
	else:
		self.material.set_shader_param("alpha", 0)


func _on_SheetButton_mouse_entered() -> void:
	selected = true
	self.material.set_shader_param("outLineSize", 0.01)


func _on_SheetButton_mouse_exited() -> void:
	selected = false


func _on_Main_new_char_to_avoid(_char) -> void:
	selected = true
	self.material.set_shader_param("outLineSize", 0.025)
