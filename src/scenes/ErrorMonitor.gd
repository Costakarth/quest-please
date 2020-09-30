extends Node2D

var error_qnty : int = 0


func _on_Main_new_error() -> void:
	error_qnty = error_qnty + 1
	$Label.text = String(error_qnty)
