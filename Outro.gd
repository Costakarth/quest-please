extends Control

func _ready():
	$TextureRect/Reason.text = SceneManager.losing_reason
