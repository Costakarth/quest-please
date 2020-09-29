extends MarginContainer

var item : Item = null

signal item_clicked

func _ready() -> void:
	$TextureRect.texture = item.texture
	
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				emit_signal("item_clicked", item)
