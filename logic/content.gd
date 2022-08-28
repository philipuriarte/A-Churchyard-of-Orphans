extends VBoxContainer

const ContentData = preload("res://logic/content_data.gd")

var save_game: SaveGame
var content_dict: Dictionary = ContentData.new().get_content_dict()
var current_page: String

# Variables that contain nodes
onready var title_label: Label = $"%TitleLabel"
onready var narr_text: RichTextLabel = $"%NarrativeText"
onready var choices_con: VBoxContainer = $"%ChoicesContainer"
onready var choice_1: PanelContainer = $"%Choice1"
onready var choice_2: PanelContainer = $"%Choice2"
onready var choice_3: PanelContainer = $"%Choice3"
onready var choice_4: PanelContainer = $"%Choice4"


# Load save game data and connect signals to Choice buttons
func _ready() -> void:
	load_content()
	set_content(current_page)
	
	# warning-ignore:return_value_discarded
	choice_1.connect("choice_btn_pressed", self, "process_choice")
	# warning-ignore:return_value_discarded
	choice_2.connect("choice_btn_pressed", self, "process_choice")
	# warning-ignore:return_value_discarded
	choice_3.connect("choice_btn_pressed", self, "process_choice")
	# warning-ignore:return_value_discarded
	choice_4.connect("choice_btn_pressed", self, "process_choice")


# Process input (Choice button press)
func process_choice(choice_index: int) -> void:
	var output_key: String
	
	if content_dict[current_page]["choices"][choice_index].has("output"):
		output_key = content_dict[current_page]["choices"][choice_index]["output"]
		set_content(output_key)


# Update nodes in ContentContainer, and update and save current_page
func set_content(output_key: String) -> void:
	set_title(output_key)
	set_narr_text(content_dict[output_key]["narr_text"])
	set_choice_btn(output_key)
	
	current_page = output_key
	save_content()


# Set visibiliy and text of TitleLabel
func set_title(output_key: String) -> void:
	if title_label.visible:
		title_label.text = ""
		title_label.visible = false
	
	if content_dict[output_key].has("title"):
		title_label.text = content_dict[output_key]["title"]
		title_label.visible = true


# Set text of NarrativeText
func set_narr_text(new_text: String) -> void:
	narr_text.bbcode_text = new_text


# Set visibility and text of Choice buttons
func set_choice_btn(output_key: String) -> void:
	for choice_i in choices_con.get_children():
		if choice_i.visible:
			choice_i.set_text("")
			choice_i.visible = false
	
	for choice in content_dict[output_key]["choices"]:
		match choice:
			1:
				choice_1.set_text(content_dict[output_key]["choices"][choice]["text"])
				choice_1.visible = true
			2:
				choice_2.set_text(content_dict[output_key]["choices"][choice]["text"])
				choice_2.visible = true
			3:
				choice_3.set_text(content_dict[output_key]["choices"][choice]["text"])
				choice_3.visible = true
			4:
				choice_4.set_text(content_dict[output_key]["choices"][choice]["text"])
				choice_4.visible = true


# Save current_page to save file
func save_content() -> void:
	save_game = SaveGame.load_savegame()
	
	save_game.current_page = current_page
	
	save_game.write_savegame()


# Load current_page on save file
func load_content() -> void:
	save_game = SaveGame.load_savegame()
	
	current_page = save_game.current_page
