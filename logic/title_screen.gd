extends PanelContainer

const NEW_SAVEGAME = preload("res://resources/new_savegame.tres")
const NEW_SAVEOPTIONS = preload("res://resources/new_saveoptions.tres")

onready var popup_confirm: Popup = $"%PopupConfirm"
onready var continue_btn: Button = $"%ContinueButton"


func _ready() -> void:
	# Set visiblity of ContinueButton to false if there is no save_game file
	if not SaveGame.save_exists():
		continue_btn.visible = false
	
	# Write new save_options file if there is no save_options file
	if not SaveOptions.save_exists():
		NEW_SAVEOPTIONS.write_saveoptions()


# Change scene to game_screen
func _on_ContinueButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/game_screen.tscn")


# Check if save_game exists, true: open PopupConfirm, false: write new save_game file and change scene to game_screen
func _on_NewButton_pressed() -> void:
	if SaveGame.save_exists():
		popup_confirm.popup_centered()
	else:
		NEW_SAVEGAME.write_savegame()
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/game_screen.tscn")


# Write new save_game file and change scene to game_screen
func _on_YesButton_pressed() -> void:
	NEW_SAVEGAME.write_savegame()
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
