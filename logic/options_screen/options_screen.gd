extends PanelContainer

var save_options: SaveOptions
var previous_screen: String

onready var popup_credits: Popup = $"%PopupCredits"
onready var popup_contact: Popup = $"%PopupContact"


# Set options to saved options
func _ready() -> void:
	save_options = SaveOptions.load_saveoptions()
	previous_screen = save_options.previous_screen


# Open PopupCredits
func _on_CreditsButton_pressed() -> void:
	popup_credits.popup_centered()


# Trigger when user presses ContactButton
func _on_ContactButton_pressed() -> void:
	popup_contact.popup_centered()


# Change scene to previous_screen
func _on_BackButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene(previous_screen)
