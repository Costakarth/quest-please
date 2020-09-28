extends Popup

const Util = preload("res://src/scripts/commons/util.gd")

onready var quest_name : Label = $TextureRect/MarginContainer/VBoxContainer/Name
onready var quest_description: RichTextLabel = $TextureRect/MarginContainer/VBoxContainer/Description

onready var tablet : TextureRect = $TextureRect
onready var item_list_mode = preload("res://src/scenes/ItemListMode.tscn")
onready var item_details_mode = preload("res://src/scenes/ItemDetailsMode.tscn")
onready var tablet_item_scene = preload("res://src/scenes/TabletItem.tscn")

onready var original_position : Vector2 = $TextureRect.rect_position

func _populate_tablet():
	var grid_container = $TextureRect/MarginContainer/VBoxContainer/GridContainer
	
	for item in ItemLoader.items:
		var tablet_item = tablet_item_scene.instance()
		tablet_item.connect("item_clicked", self, "_on_item_clicked")
		tablet_item.item = item
		grid_container.add_child(tablet_item)


func _on_Popup_popup_hide() -> void:
	var grid_container = $TextureRect/MarginContainer
	
	$TextureRect.rect_position = original_position

	Util.delete_children_from_node(grid_container)
	
	get_tree().paused = false
	
	
func _on_item_clicked(item : Item):
	var container = $TextureRect/MarginContainer
	
	Util.delete_children_from_node(container)
		
	var details_mode = item_details_mode.instance()
	$TextureRect/MarginContainer.add_child(details_mode)
	
	var vbox_container = $TextureRect/MarginContainer/VBoxContainer
	var name_label : Label = $TextureRect/MarginContainer/VBoxContainer/Name
	var description : RichTextLabel = $TextureRect/MarginContainer/VBoxContainer/Description
	var miniature : TextureRect = $TextureRect/MarginContainer/VBoxContainer/Miniature/Image
	var detail : TextureRect = $TextureRect/MarginContainer/VBoxContainer/Detail/Image
		
	name_label.text = item.name
	description.text = item.description
	miniature.texture = item.texture
	detail.texture = item.texture

func _on_PopupManager_tablet_open() -> void:
	var item_mode = item_list_mode.instance()
	$TextureRect/MarginContainer.add_child(item_mode)
	
	_populate_tablet()
	popup()
	
	$Tween.interpolate_property(tablet, "rect_position:y", tablet.rect_position.y, 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_PopupManager_tablet_close() -> void:
	self.hide()


func _on_PopupManager_tablet_open_on_item(item) -> void:
	_on_item_clicked(item)
	popup()
	
	$Tween.interpolate_property(tablet, "rect_position:y", tablet.rect_position.y, 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
