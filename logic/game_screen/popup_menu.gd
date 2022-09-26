extends Popup

var save_options: SaveOptions


# Change scene to title_screen
func _on_TitleButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen/title_screen.tscn")


# Close PopupMenu
func _on_ContinueButton_pressed() -> void:
	hide()


# Change scene to option_screen
func _on_OptionsButton_pressed() -> void:
	save_options = SaveOptions.load_saveoptions()
	save_options.previous_screen = "res://scenes/game_screen/game_screen.tscn"
	save_options.write_saveoptions()
	
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/options_screen/options_screen.tscn")


# Close PopupMenu if press/click event occurs outside MenuScreen
func _on_Overlay_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		hide()
