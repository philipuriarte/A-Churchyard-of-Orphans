extends VBoxContainer

var save_game: SaveGame
var story_data: Dictionary = StoryData.new().get_story_data()
var current_page: String

onready var title_label: Label = $"%TitleLabel"
onready var story_text: RichTextLabel = $"%StoryText"
onready var choices_con: VBoxContainer = $"%ChoicesContainer"
onready var choice_1: PanelContainer = $"%Choice1"
onready var choice_2: PanelContainer = $"%Choice2"
onready var choice_3: PanelContainer = $"%Choice3"
onready var choice_4: PanelContainer = $"%Choice4"


# Load save game data and connect signals to Choice buttons
func _ready() -> void:
	load_story()
	set_story(current_page)
	
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
	var next_scene: String
	
	if story_data[current_page]["choices"][choice_index].has("next_scene"):
		next_scene = story_data[current_page]["choices"][choice_index]["next_scene"]
		set_story(next_scene)


# Update nodes in ContentContainer, and update and save current_page
func set_story(next_scene: String) -> void:
	var s_text: String = story_data[next_scene]["story_text"]
	
	set_title(next_scene)
	set_story_text(s_text)
	set_choice_btn(next_scene)
	
	current_page = next_scene
	save_story()


# Set visibiliy and text of TitleLabel
func set_title(next_scene: String) -> void:
	if title_label.visible:
		title_label.text = ""
		title_label.visible = false
	
	if story_data[next_scene].has("title"):
		var title_text = story_data[next_scene]["title"]
		title_label.text = title_text
		title_label.visible = true


# Set text of NarrativeText
func set_story_text(new_text: String) -> void:
	story_text.bbcode_text = new_text


# Set visibility and text of Choice buttons
func set_choice_btn(next_scene: String) -> void:
	for choice_i in choices_con.get_children():
		if choice_i.visible:
			choice_i.set_text("")
			choice_i.visible = false
	
	for choice in story_data[next_scene]["choices"]:
		var choice_text: String = story_data[next_scene]["choices"][choice]["text"]
		
		match choice:
			1:
				choice_1.set_text(choice_text)
				choice_1.visible = true
			2:
				choice_2.set_text(choice_text)
				choice_2.visible = true
			3:
				choice_3.set_text(choice_text)
				choice_3.visible = true
			4:
				choice_4.set_text(choice_text)
				choice_4.visible = true


# Save story data to save_game
func save_story() -> void:
	save_game = SaveGame.load_savegame()
	save_game.current_page = current_page
	save_game.write_savegame()


# Load save_game data
func load_story() -> void:
	save_game = SaveGame.load_savegame()
	current_page = save_game.current_page
