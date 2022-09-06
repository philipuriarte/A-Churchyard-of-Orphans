extends Popup


# Close PopupCredits
func _on_CloseButton_pressed() -> void:
	hide()


# Close PopupCredits if press/click event occurs outside CreditsScreen
func _on_Overlay_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		hide()
