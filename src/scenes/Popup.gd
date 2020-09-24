extends Popup

onready var quest_name_label = $MarginContainer/VBoxContainer/Name
onready var quest_description_label = $MarginContainer/VBoxContainer/Description
onready var hbox_objects = $MarginContainer/VBoxContainer/HBoxContainer

func _on_quest_clicked(quest):
	quest_name_label.text = quest.name
	quest_description_label.text = quest.description
	
	for n in hbox_objects.get_children():
		hbox_objects.remove_child(n)
		n.queue_free()
	
	for item in quest.items_required:
			var textureRect : = TextureRect.new()
			textureRect.texture = item.texture
			hbox_objects.add_child(textureRect)
	
	popup()


func _on_Popup_popup_hide() -> void:
	get_tree().paused = false
