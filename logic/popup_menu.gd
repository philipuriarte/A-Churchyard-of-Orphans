extends Popup


func _on_TitleButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")


func _on_ContinueButton_pressed() -> void:
	hide()
