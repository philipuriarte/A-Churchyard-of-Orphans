extends Node

var save_options: SaveOptions

onready var button_normal: AudioStreamPlayer = $ButtonNormal


func _ready() -> void:
	connect_buttons(get_tree().root)
	# warning-ignore:return_value_discarded
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")


func connect_buttons(root):
	for child in root.get_children():
		if child is BaseButton:
			connect_to_button(child)
		connect_buttons(child)


func connect_to_button(button):
	button.connect("pressed", self, "_on_Button_pressed")
	
	if button is OptionButton:
		button.connect("item_selected", self, "_on_Button_pressed")


func _on_Button_pressed(_x=0):
	save_options = SaveOptions.load_saveoptions()
	
	if save_options.sfx_on:
		button_normal.play()


func _on_SceneTree_node_added(node):
	if node is Button:
		connect_to_button(node)
