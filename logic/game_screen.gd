extends PanelContainer

func _ready() -> void:
	pass


func _on_TitleButton_pressed() -> void:
	get_tree().change_scene("res://scenes/title_screen.tscn")
