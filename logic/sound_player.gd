extends Node

var save_options: SaveOptions

onready var button_normal: AudioStreamPlayer = $ButtonNormal


# Connect all buttons to play sfx
func _ready() -> void:
	connect_buttons(get_tree().root)
	# warning-ignore:return_value_discarded
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")


# Recursively get all button children
func connect_buttons(root):
	for child in root.get_children():
		if child is BaseButton:
			connect_to_button(child)
		connect_buttons(child)


# Connect button to play sfx upon user interaction
func connect_to_button(button):
	button.connect("pressed", self, "_on_Button_pressed")
	
	if button is OptionButton:
		button.connect("item_selected", self, "_on_Button_pressed")


# Play sfx if save_options.sfx_on is true
# The parameter "_x=0" is only to avoid errors and warnings when button is OptionButton for the "item_selected" signal
func _on_Button_pressed(_x=0):
	save_options = SaveOptions.load_saveoptions()
	
	if save_options.sfx_on:
		button_normal.play()


# Connect node to play sfx if node is a button
func _on_SceneTree_node_added(node):
	if node is BaseButton:
		connect_to_button(node)
