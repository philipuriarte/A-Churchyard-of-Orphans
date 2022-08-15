extends PanelContainer

# Variables that contain nodes
onready var popup_menu: Popup = $"%PopupMenu"
onready var top_text: Label = $"%TopText"


# Open the PopupMenu node
func _on_MenuButton_pressed() -> void:
	popup_menu.popup_centered()


# Set text to TopText node
func set_top_text(new_text: String) -> void:
	top_text.text = new_text
