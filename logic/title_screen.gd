extends PanelContainer

onready var continue_btn: Button = $"%ContinueButton"


# Should set visiblity of Continue button if there is save file or not
func _ready() -> void:
	continue_btn.visible = false


# Change scene to game_screen
# Should start new game instead of only changing scene to game_screen
func _on_NewButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen.tscn")


# Change scene to option_screen
func _on_OptionsButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/options_screen.tscn")


# Should change scene to extras_scene (to be created)
func _on_ExtrasButton_pressed() -> void:
	pass
