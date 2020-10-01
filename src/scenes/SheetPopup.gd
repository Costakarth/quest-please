extends Popup




func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			hide()



func _on_PopupManager_sheet_open() -> void:
	popup()


func _on_Main_new_char_to_avoid(character : CharacterType) -> void:
	$TextureRect/MarginContainer/TextureRect.texture = character.texture
