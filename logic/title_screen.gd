extends PanelContainer

onready var continue_btn: Button = $"%ContinueButton"


# Should set visiblity of Continue button if there is save file or not
func _ready() -> void:
	continue_btn.visible = false


# Changes scene to game_screen
# Should start new game instead of only changing scene to game_screen
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


