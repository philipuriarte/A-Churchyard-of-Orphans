extends PanelContainer

signal continue_game
signal new_game

var save: SaveGame

onready var popup_new_confirmation: Popup = $"%PopupNewConfirmation"
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


# Emit new_save signal and change scene to game_screen
func _on_NewButton_pressed() -> void:
	if SaveGame.save_exists():
		popup_new_confirmation.popup_centered()
	else:
		emit_signal("new_game")
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/game_screen.tscn")


# Change scene to option_screen
func _on_OptionsButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/options_screen.tscn")


# Should change scene to extras_scene (to be created)
func _on_ExtrasButton_pressed() -> void:
	pass
