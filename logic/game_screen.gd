extends PanelContainer


func _on_TitleButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")
