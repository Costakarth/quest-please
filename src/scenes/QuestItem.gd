extends Node2D

var is_clicked = false

func _on_ClickableArea_clicked() -> void:
	is_clicked = true
		
		
func _process(delta: float) -> void:
	if (is_clicked):
		$Sprite.visible = false
		$BigSprite.visible = true
	else:
		$Sprite.visible = true
		$BigSprite.visible = false
		
	


func _on_ClickableArea_not_clicked() -> void:
	is_clicked = false
