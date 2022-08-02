extends VBoxContainer

# Constants that contain reusable scenes
const LocationName = preload("res://scenes/reused_scenes/location_name.tscn")
const NarrativeText = preload("res://scenes/reused_scenes/narrative_text.tscn")

var choice_result := 0

# Variables that contain nodes
onready var narr_text = $NarrativeText
onready var choices_con = $ChoicesMargin/ChoicesContainer
onready var choice_1 = $ChoicesMargin/ChoicesContainer/Choice1
onready var choice_2 = $ChoicesMargin/ChoicesContainer/Choice2
onready var choice_3 = $ChoicesMargin/ChoicesContainer/Choice3
onready var choice_4 = $ChoicesMargin/ChoicesContainer/Choice4


func set_narr_text(new_text: String):
	narr_text.text = new_text


# Sets visibility and text of choice buttons, sets text of NarrativeText
func choice_output(result: int) -> void:
	set_narr_text("You chose choice #" + result as String)


# Functions for checking if any of the Choice buttons were released
func _on_Choice1_button_up() -> void:
	choice_result = 1
	choice_output(choice_result)


func _on_Choice2_button_up() -> void:
	choice_result = 2
	choice_output(choice_result)


func _on_Choice3_button_up() -> void:
	choice_result = 3
	choice_output(choice_result)


func _on_Choice4_button_up() -> void:
	choice_result = 4
	choice_output(choice_result)
