extends PanelContainer

# Variables that contain nodes
onready var popup_menu: Popup = $"%PopupMenu"
onready var top_text: Label = $"%TopText"
onready var character_button: Button = $"%CharacterButton"
onready var inventory_button: Button = $"%InventoryButton"
onready var journal_button: Button = $"%JournalButton"


# Set BottomContainer buttons visibility to false, will rework in the future
func _ready() -> void:
	character_button.visible = false
	inventory_button.visible = false
	journal_button.visible = false


# Open the PopupMenu node
func _on_MenuButton_pressed() -> void:
	popup_menu.popup_centered()


# Set text to TopText node
func set_top_text(new_text: String) -> void:
	top_text.text = new_text
