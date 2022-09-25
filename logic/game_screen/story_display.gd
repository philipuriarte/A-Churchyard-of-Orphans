extends VBoxContainer

const CHOICE_BUTTON = preload("res://scenes/game_screen/choice_button.tscn")

var save_game: SaveGame
var story_data: Dictionary = StoryData.new().get_story_data()
var current_scene: String
var previous_scene: String

onready var title_label: Label = $"%TitleLabel"
onready var story_text: RichTextLabel = $"%StoryText"
onready var choices_con: VBoxContainer = $"%ChoicesContainer"


# Load and set save_game data
func _ready() -> void:
	load_story()
	set_save_story(current_scene)


# Load save_game data
func load_story() -> void:
	save_game = SaveGame.load_savegame()
	current_scene = save_game.current_scene


# Process player input/Choice button press
func process_choice(choice_index: int) -> void:
	var choice: Dictionary = story_data[current_scene]["choices"][choice_index]
	
	if choice.has("next_scene"):
		var next_scene: String = choice["next_scene"]
		set_save_story(next_scene)
	
	process_output(choice)


# Process choice output/s
func process_output(choice: Dictionary) -> void:
	if choice.has("outputs"):
		story_text.text += "\n"
		
		for output in choice["outputs"]:
			var output_type: String = choice["outputs"][output]["type"]
			var output_value: String = choice["outputs"][output]["value"]
			save_game = SaveGame.load_savegame()
			
			match output_type:
				"add_item":
					save_game.inventory.append(output_value)
					story_text.text += "\n> " + output_value + " added to inventory"
				"remove_item":
					save_game.inventory.erase(output_value)
					story_text.text += "\n> " + output_value + " removed from inventory"
			
			save_game.write_savegame()


# Update nodes in StoryContainer
func set_save_story(next_scene: String) -> void:
	var scene: Dictionary = story_data[next_scene]
	var story_bbcode_text: String = scene["story_text"]
	
	set_title(scene)
	set_story_text(story_bbcode_text)
	set_choice_btn(scene)
	save_story(next_scene)


# Set visibiliy and text of TitleLabel
func set_title(scene: Dictionary) -> void:
	if scene.has("title"):
		var title_text = scene["title"]
		
		title_label.text = title_text
		title_label.visible = true
	elif title_label.visible:
		title_label.text = ""
		title_label.visible = false


# Set text of StoryText
func set_story_text(new_text: String) -> void:
	story_text.bbcode_text = new_text


# Instance and set text of choice_button.tscn
func set_choice_btn(scene: Dictionary) -> void:
	var choice_index: int = 1
	
	for choice_i in choices_con.get_children():
		choice_i.queue_free()
	
	for choice in scene["choices"]:
		if process_condition(scene, choice_index):
			var choice_text: String = scene["choices"][choice]["text"]
			var choice_button: Node = CHOICE_BUTTON.instance()
			
			choices_con.add_child(choice_button)
			choice_button.set_choice_index(choice_index)
			choice_button.set_choice_text(choice_text)
			# warning-ignore:return_value_discarded
			choice_button.connect("choice_btn_pressed", self, "process_choice")
			
			choice_index += 1


# Process choice condition/s
func process_condition(scene: Dictionary, choice_index: int) -> bool:
	var choice: Dictionary = scene["choices"][choice_index]
	
	if choice.has("conditions"):
		for condition in choice["conditions"]:
			var condition_type: String = choice["conditions"][condition]["type"]
			var condition_value: String = choice["conditions"][condition]["value"]
			save_game = SaveGame.load_savegame()
			
			match condition_type:
				"have_item":
					if condition_value in save_game.inventory: return true
					else: return false
				"previous_choice":
					if condition_value in save_game.previous_choices: return true
					else: return false
		
		return true
	else:
		return true


# Update and save previous_scene, current_scene & previous_choices
func save_story(next_scene: String):
	previous_scene = current_scene
	current_scene = next_scene
	
	save_game = SaveGame.load_savegame()
	save_game.current_scene = next_scene
	save_game.previous_choices.append(next_scene)
	save_game.write_savegame()
