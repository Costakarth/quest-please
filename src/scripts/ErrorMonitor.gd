extends Node2D

var error_qnty : int = 0

export(int) var timer = 3

export(DynamicFont) var small
export(DynamicFont) var largest


func _on_Main_new_error(quest : Quest) -> void:
	error_qnty = error_qnty + 1
	if !quest.has_error:
		$Label.text = "WRONG REJECT"
	else:
		$Label.text = quest.error
	$Label.add_font_override("font",small)
	$Timer.start(timer)


func _on_Timer_timeout() -> void:
	$Label.add_font_override("font",largest)
	$Label.text = String(error_qnty)
