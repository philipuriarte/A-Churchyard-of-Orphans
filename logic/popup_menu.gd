extends Popup


# Changes scene to title_screen
func _on_TitleButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")


# Close the Popup Menu
func _on_ContinueButton_pressed() -> void:
	hide()
