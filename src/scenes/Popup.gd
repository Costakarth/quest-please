extends Popup

onready var quest_name : Label = $TextureRect/MarginContainer/VBoxContainer/Name
onready var quest_description: RichTextLabel = $TextureRect/MarginContainer/VBoxContainer/Description
onready var hbox_objects = $TextureRect/MarginContainer/VBoxContainer/HBoxContainer
onready var tablet : TextureRect = $TextureRect

onready var original_position : Vector2 = $TextureRect.rect_position

func _on_quest_clicked(quest):
	quest_name.text = quest.name
	quest_description.text = quest.description
	
	for n in hbox_objects.get_children():
		hbox_objects.remove_child(n)
		n.queue_free()
	
	for item in quest.items_required:
			var textureRect : = TextureRect.new()
			textureRect.texture = item.texture
			var centerContainer : = CenterContainer.new()
			centerContainer.add_child(textureRect)
			hbox_objects.add_child(centerContainer)
	
	popup()
	
	$Tween.interpolate_property(tablet, "rect_position:x", tablet.rect_position.x, 377, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Popup_popup_hide() -> void:
	$TextureRect.rect_position = original_position
	get_tree().paused = false


func _on_TabletButton_clicked() -> void:
	pass # Replace with function body.
