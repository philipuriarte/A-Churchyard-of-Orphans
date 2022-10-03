extends VBoxContainer

var save_options: SaveOptions

onready var lang_options: OptionButton = $"%LangOptions"
onready var music_button: CheckButton = $"%MusicButton"
onready var sfx_button: CheckButton = $"%SFXButton"
onready var size_options: OptionButton = $"%SizeOptions"
onready var line_options: OptionButton = $"%LineOptions"
onready var test_text: Label = $"%TestText"


# Set options to saved options
func _ready() -> void:
	load_options()


# Load save_options data
func load_options():
	save_options = SaveOptions.load_saveoptions()
	
	lang_options.selected = save_options.language
	music_button.pressed = save_options.music_on
	sfx_button.pressed = save_options.sfx_on
	size_options.selected = save_options.font_size
	line_options.selected = save_options.line_spacing


# Set and save language
func _on_LangOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.language = 0
	
	save_options.write_saveoptions()


# Set and save music on/off
func _on_MusicButton_toggled(button_pressed: bool) -> void:
	save_options = SaveOptions.load_saveoptions()
	save_options.music_on = button_pressed
	save_options.write_saveoptions()


# Set and save sfx on/off
func _on_SFXButton_toggled(button_pressed: bool) -> void:
	save_options = SaveOptions.load_saveoptions()
	save_options.sfx_on = button_pressed
	save_options.write_saveoptions()


# Set and save font size
func _on_SizeOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.font_size = 0 # 10 font size
		1:
			save_options.font_size = 1 # 11 font size
		2:
			save_options.font_size = 2 # 12 font size
		3:
			save_options.font_size = 3 # 13 font size
		4:
			save_options.font_size = 4 # 14 font size
	
	save_options.write_saveoptions()


# Set and save line spacing of text
func _on_LineOptions_item_selected(index: int) -> void:
	save_options = SaveOptions.load_saveoptions()
	
	match index:
		0:
			save_options.line_spacing = 0 # 10 line spacing
		1:
			save_options.line_spacing = 1 # 12 line spacing
		2:
			save_options.line_spacing = 2 # 14 line spacing
		3:
			save_options.line_spacing = 3 # 16 line spacing
		4:
			save_options.line_spacing = 4 # 18 line spacing
	
	save_options.write_saveoptions()
