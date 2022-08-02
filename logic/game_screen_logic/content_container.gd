extends VBoxContainer


# Constants that contain reusable scenes
const LocationName = preload("res://scenes/reused_scenes/location_name.tscn")
const NarrativeText = preload("res://scenes/reused_scenes/narrative_text.tscn")
const Choice = preload("res://scenes/reused_scenes/choice.tscn")

# Variables that contain nodes
onready var choices_container = $ChoicesMargin/ChoicesContainer

func _ready() -> void:
	pass
