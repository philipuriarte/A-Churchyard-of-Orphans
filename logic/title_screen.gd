extends PanelContainer

# Changes scene to game_screen
func _on_NewButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen.tscn")


# Changes scene to option_screen
func _on_OptionsButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/options_screen.tscn")


# Closes the game
func _on_QuitButton_pressed() -> void:
	get_tree().quit()


