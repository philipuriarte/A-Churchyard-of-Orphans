extends PanelContainer

func _ready() -> void:
	pass


# Changes scene to titlee_screen
func _on_BackButton_pressed() -> void:
	get_tree().change_scene("res://scenes/title_screen.tscn")
