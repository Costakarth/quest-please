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


func _on_ButtonControl_mouse_entered() -> void:
	selected = true


func _on_ButtonControl_mouse_exited() -> void:
	selected = false
