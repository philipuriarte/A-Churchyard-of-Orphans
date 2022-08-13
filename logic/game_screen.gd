extends PanelContainer

onready var popup_menu: Popup = $"%PopupMenu"


# Will open the PopupMenu node
func _on_MenuButton_pressed() -> void:
	popup_menu.popup_centered()
