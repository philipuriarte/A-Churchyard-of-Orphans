extends Popup


# Change scene to title_screen
func _on_TitleButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")


# Close PopupMenu
func _on_ContinueButton_pressed() -> void:
	hide()


# Close PopupMenu if press/click event occurs outside MenuScreen
func _on_PopupMenu_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			hide()
