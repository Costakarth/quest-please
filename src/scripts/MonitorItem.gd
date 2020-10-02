extends MarginContainer

signal clicked

var item : Item

func _enter_tree() -> void:
	$TextureRect.texture = item.texture


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				emit_signal("clicked", item)
