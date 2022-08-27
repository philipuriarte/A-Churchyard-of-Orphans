extends PanelContainer

signal continue_game
signal new_game

var save: SaveGame

onready var popup_confirm: Popup = $"%PopupConfirm"
onready var continue_btn: Button = $"%ContinueButton"


# Set visiblity of Continue button if there is a save file or not
func _ready() -> void:
	if not SaveGame.save_exists():
		continue_btn.visible = false


# Emit continue_game signal and change scene to game_screen
func _on_ContinueButton_pressed() -> void:
	emit_signal("continue_game")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen.tscn")


# Check if save exists, true: open PopupConfirm, false: emit new_save signal and change scene to game_screen
func _on_NewButton_pressed() -> void:
	if SaveGame.save_exists():
		popup_confirm.popup_centered()
	else:
		emit_signal("new_game")
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/game_screen.tscn")


# Emit new_save signal and change scene to game_screen
func _on_YesButton_pressed() -> void:
	emit_signal("new_game")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen.tscn")


# Close PopupConfirm
func _on_NoButton_pressed() -> void:
	popup_confirm.hide()


# Close PopupConfirm if press/click event occurs outside ConfirmScreen
func _on_Overlay_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		popup_confirm.hide()


# Change scene to option_screen
func _on_OptionsButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/options_screen.tscn")


# Should change scene to extras_scene (to be created)
func _on_ExtrasButton_pressed() -> void:
	pass
