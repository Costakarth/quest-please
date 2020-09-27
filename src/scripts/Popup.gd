extends Popup

const Util = preload("res://src/scripts/commons/util.gd")

onready var quest_name : Label = $Texture/Margin/VBoxContainer/Name
onready var quest_description: RichTextLabel = $Texture/Margin/VBoxContainer/Description
onready var quest_items : HBoxContainer = $Texture/Margin/VBoxContainer/Items
onready var tablet : TextureRect = $Texture

onready var original_position : Vector2 = $TextureRect.rect_position

func _on_quest_clicked(quest):
	quest_name.text = quest.name
	quest_description.text = quest.description
	
	Util.delete_children_from_node(quest_items)
	
	for item in quest.items_required:
			var textureRect : = TextureRect.new()
			textureRect.texture = item.texture
			var centerContainer : = CenterContainer.new()
			centerContainer.add_child(textureRect)
			quest_items.add_child(centerContainer)
	
	popup()
	
	$Tween.interpolate_property(tablet, "rect_position:x", tablet.rect_position.x, 377, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Popup_popup_hide() -> void:
	$TextureRect.rect_position = original_position
	get_tree().paused = false


func _on_TabletButton_clicked() -> void:
	pass # Replace with function body.
