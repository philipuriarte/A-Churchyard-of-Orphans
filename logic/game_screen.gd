extends PanelContainer

# Variables that contain scenes to instance
const NarrativeText = preload("res://scenes/reused_scenes/narrative_text.tscn")
const Choice = preload("res://scenes/reused_scenes/choice.tscn")

# Variables that contain nodes
onready var content_con = $MarginContainer/MainCointainer/ContentContainer
onready var choices_con = $MarginContainer/MainCointainer/ChoicesMargin/ChoicesContainer
onready var narr_text = $MarginContainer/MainCointainer/ContentContainer/NarrativeText


func _ready() -> void:
	pass


func _on_TitleButton_pressed() -> void:
	get_tree().change_scene("res://scenes/title_screen.tscn")
