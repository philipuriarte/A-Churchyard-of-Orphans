extends PanelContainer

onready var popup_menu: PopupPanel = $"%PopupMenu"

func _on_MenuButton_pressed() -> void:
	popup_menu.popup_centered()
