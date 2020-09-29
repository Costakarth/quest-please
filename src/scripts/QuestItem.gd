extends Node2D

var is_clicked = false

var initial_position : Vector2 setget set_initial_position

func _on_ClickableArea_clicked() -> void:
	is_clicked = true
		
	
func _on_ClickableArea_not_clicked() -> void:
	is_clicked = false

func set_initial_position(position : Vector2):
	$Pickable/PickableArea.initial_position = position
	
