extends VBoxContainer

# Constants that contain reusable scenes
const LocationName = preload("res://scenes/reused_scenes/location_name.tscn")
const NarrativeText = preload("res://scenes/reused_scenes/narrative_text.tscn")

var choice_result := 0

# Variables that contain nodes
onready var choices_container = $ChoicesMargin/ChoicesContainer


func _ready() -> void:
	pass


func choice_output(result: int) -> void:
	print("Choice = ", result)


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
