extends PopupPanel


# Changes scene to title_screen
func _on_TitleButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")


# Closes the game
func _on_QuitButton_pressed() -> void:
	get_tree().quit()
