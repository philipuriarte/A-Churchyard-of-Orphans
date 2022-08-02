extends VBoxContainer

# Constants that contain reusable scenes
const LocationName = preload("res://scenes/reused_scenes/location_name.tscn")
const NarrativeText = preload("res://scenes/reused_scenes/narrative_text.tscn")

var choice_result := 0

# Variables that contain nodes
onready var choices_container = $ChoicesMargin/ChoicesContainer

func _ready() -> void:
	pass
