extends Control

func _ready():
	$BackMonitorLayer/TextureRect/MarginContainer/VBoxContainer/Reason.text = SceneManager.losing_reason
