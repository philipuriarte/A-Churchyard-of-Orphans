extends VBoxContainer

const CHOICE_BUTTON = preload("res://scenes/game_screen/choice_button.tscn")

var save_game: SaveGame
var story_data: Dictionary = StoryData.new().get_story_data()
var current_scene: String
var previous_scene: String

onready var title_label: Label = $"%TitleLabel"
onready var story_text: RichTextLabel = $"%StoryText"
onready var choices_con: VBoxContainer = $"%ChoicesContainer"


# Load save game data and connect signals to Choice buttons
func _ready() -> void:
	load_story()
	set_save_story(current_scene)


# Load save_game data
func load_story() -> void:
	save_game = SaveGame.load_savegame()
	current_scene = save_game.current_scene


# Process input (Choice button press)
func process_choice(choice_index: int) -> void:
	var next_scene: String
	
	if story_data[current_scene]["choices"][choice_index].has("next_scene"):
		next_scene = story_data[current_scene]["choices"][choice_index]["next_scene"]
		set_save_story(next_scene)
	
	if story_data[previous_scene]["choices"][choice_index].has("output"):
		var output_type: String = story_data[previous_scene]["choices"][choice_index]["output"]["type"]
		var output_value: String = story_data[previous_scene]["choices"][choice_index]["output"]["value"]
		save_game = SaveGame.load_savegame()
		
		match output_type:
			"add_item":
				save_game.inventory.append(output_value)
				story_text.text += "\n\n> " + output_value + " is added to inventory"
			"remove_item":
				save_game.inventory.erase(output_value)
				story_text.text += "\n\n> " + output_value + " is removed from inventory"
		
		save_game.write_savegame()


# Update nodes in StoryContainer, and update and save current_scene
func set_save_story(next_scene: String) -> void:
	var s_text: String = story_data[next_scene]["story_text"]
	
	set_title(next_scene)
	set_story_text(s_text)
	set_choice_btn(next_scene)
	
	save_game = SaveGame.load_savegame()
	previous_scene = current_scene
	current_scene = next_scene
	save_game.current_scene = next_scene
	save_game.previous_choices.append(next_scene)
	save_game.write_savegame()


# Set visibiliy and text of TitleLabel
func set_title(next_scene: String) -> void:
	if story_data[next_scene].has("title"):
		var title_text = story_data[next_scene]["title"]
		title_label.text = title_text
		title_label.visible = true
	else:
		title_label.text = ""
		title_label.visible = false


# Set text of StoryText
func set_story_text(new_text: String) -> void:
	story_text.bbcode_text = new_text


# Instance and set text of choice_button.tscn
func set_choice_btn(next_scene: String) -> void:
	var choice_index: int = 1
	
	for choice_i in choices_con.get_children():
		choice_i.queue_free()
	
	for choice in story_data[next_scene]["choices"]:
		var choice_text: String = story_data[next_scene]["choices"][choice]["text"]
		var choice_button: Node = CHOICE_BUTTON.instance()
		
		choices_con.add_child(choice_button)
		choice_button.set_choice_index(choice_index)
		choice_button.set_choice_text(choice_text)
		# warning-ignore:return_value_discarded
		choice_button.connect("choice_btn_pressed", self, "process_choice")
		
		choice_index += 1
