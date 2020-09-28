extends Node

signal tablet_open
signal tablet_open_on_item
signal tablet_close

signal sheet_open
signal sheet_close

signal quest_open
signal quest_close


func _on_TabletButton_clicked() -> void:
	emit_signal("tablet_open")

func _on_SheetButton_clicked() -> void:
	emit_signal("sheet_open")

func _on_quest_clicked(quest) -> void:
	emit_signal("quest_open", quest)
	
func _on_item_clicked(item) -> void:
	emit_signal("quest_close")
	emit_signal("tablet_open_on_item", item)
	
