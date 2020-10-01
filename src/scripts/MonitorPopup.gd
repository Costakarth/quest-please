extends Popup

const Util = preload("res://src/scripts/commons/util.gd")

onready var monitor_item = preload("res://src/scenes/MonitorItem.tscn")

onready var quest_name : Label = $Texture/Margin/VBoxContainer/Name
onready var quest_description: RichTextLabel = $Texture/Margin/VBoxContainer/Description
onready var quest_items : HBoxContainer = $Texture/Margin/VBoxContainer/Items
onready var tablet : TextureRect = $Texture
onready var popup_manager = get_node("../../PopupManager")

onready var original_position : Vector2 = tablet.rect_position

func _quest_clicked(quest):
	quest_name.text = quest.name
	quest_description.text = quest.description
	
	Util.delete_children_from_node(quest_items)
	
	for item in quest.items_required:
		var monitor_item_instance = monitor_item.instance()
		monitor_item_instance.item = item
		monitor_item_instance.connect("clicked", popup_manager, "_on_item_clicked")
		quest_items.add_child(monitor_item_instance)
	
	popup()
	
	$Tween.interpolate_property(tablet, "rect_position:x", tablet.rect_position.x, 377, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			hide()
			emit_signal("popup_hide")


func _on_Popup_popup_hide() -> void:
	tablet.rect_position = original_position


func _on_PopupManager_quest_open(quest) -> void:
	_quest_clicked(quest)


func _on_PopupManager_quest_close() -> void:
	hide()
