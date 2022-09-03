extends Popup

const NEW_SAVEGAME = preload("res://resources/new_savegame.tres")


# Write new save_game file and change scene to game_screen
func _on_YesButton_pressed() -> void:
	NEW_SAVEGAME.write_savegame()
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen/game_screen.tscn")


# Close PopupConfirm
func _on_NoButton_pressed() -> void:
	hide()


# Close PopupConfirm if press/click event occurs outside ConfirmScreen
func _on_Overlay_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		hide()
