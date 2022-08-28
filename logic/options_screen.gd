extends PanelContainer

var save_options: SaveOptions

onready var popup_credits: Popup = $"%PopupCredits"
onready var test_text: Label = $"%TestText"
onready var lang_options: OptionButton = $"%LangOptions"
onready var music_button: CheckButton = $"%MusicButton"
onready var sfx_button: CheckButton = $"%SFXButton"
onready var size_options: OptionButton = $"%SizeOptions"
onready var line_options: OptionButton = $"%LineOptions"


# Set options to saved options
func _ready() -> void:
	load_options()


# Set language
func _on_LangOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.language = 0
	
	save_options.write_saveoptions()


# Set music on/off
func _on_MusicButton_toggled(button_pressed: bool) -> void:
	save_options = SaveOptions.load_saveoptions()
	save_options.music = button_pressed
	save_options.write_saveoptions()


# Set sfx on/off
func _on_SFXButton_toggled(button_pressed: bool) -> void:
	save_options = SaveOptions.load_saveoptions()
	save_options.sfx = button_pressed
	save_options.write_saveoptions()


# Set font size
func _on_SizeOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.font_size = 0
		1:
			save_options.font_size = 1
		2:
			save_options.font_size = 2
		3:
			save_options.font_size = 3
		4:
			save_options.font_size = 4
	
	save_options.write_saveoptions()


# Set line spacing of text
func _on_LineOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.line_spacing = 0
		1:
			save_options.line_spacing = 1
		2:
			save_options.line_spacing = 2
		3:
			save_options.line_spacing = 3
		4:
			save_options.line_spacing = 4
	
	save_options.write_saveoptions()


# Open PopupCredits
func _on_CreditsButton_pressed() -> void:
	popup_credits.popup_centered()


# Close PopupCredits
func _on_CloseButton_pressed() -> void:
	popup_credits.hide()


# Close PopupCredits if press/click event occurs outside CreditsScreen
func _on_PopupCredits_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			popup_credits.hide()


# Trigger when user presses ContactButton
func _on_ContactButton_pressed() -> void:
	print("User pressed Contact us")


# Change scene to title_screen
func _on_BackButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")


# Load save_options data
func load_options():
	save_options = SaveOptions.load_saveoptions()
	
	lang_options.selected = save_options.language
	music_button.pressed = save_options.music
	sfx_button.pressed = save_options.sfx
	size_options.selected = save_options.font_size
	line_options.selected = save_options.line_spacing
