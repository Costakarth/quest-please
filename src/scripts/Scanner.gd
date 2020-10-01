extends Node2D



func _on_PopupManager_quest_close() -> void:
	$CanvasLayer/ColorRect.visible = true


func _on_PopupManager_quest_open(quest) -> void:
	$CanvasLayer/ColorRect.visible = false


func _on_PopupManager_tablet_close() -> void:
	$CanvasLayer/ColorRect.visible = true


func _on_PopupManager_tablet_open() -> void:
	$CanvasLayer/ColorRect.visible = false


func _on_PopupManager_tablet_open_on_item() -> void:
	$CanvasLayer/ColorRect.visible = false
