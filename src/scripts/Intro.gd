extends Control

var intro_text = [
"""Hey novice.

Your application request as \"quest giver\" of Cyberpunk 7720 has been accepted. 

Congratulations.""",

"""You should have already read the manual provided, but just to be sure I remind you how your work works.""",

"""PROVA
PROVA"""]

var index = 0
onready var label = $BackMonitorLayer/TextureRect/Text
				
func _ready() -> void:
	label.text = intro_text[index]


func _on_Control_clicked() -> void:
	index = index + 1
	
	if index >= intro_text.size():
		get_tree().change_scene("res://src/scenes/Main.tscn")
		return
	
	label.text = intro_text[index]
