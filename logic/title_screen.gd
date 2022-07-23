extends PanelContainer

func _ready() -> void:
	pass

func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/game_screen.tscn")
