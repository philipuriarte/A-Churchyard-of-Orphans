extends PanelContainer

onready var popup_menu: PopupPanel = $"%PopupMenu"


func _on_MenuButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		popup_menu.popup_centered()
	else:
		popup_menu.hide()
