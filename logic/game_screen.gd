extends PanelContainer

var save: SaveGame

onready var popup_menu: Popup = $"%PopupMenu"
onready var top_text: Label = $"%TopText"
onready var character_button: Button = $"%CharacterButton"
onready var inventory_button: Button = $"%InventoryButton"
onready var journal_button: Button = $"%JournalButton"


# Set BottomContainer buttons visibility to false
func _ready() -> void:
	load_game()


# Open the PopupMenu node
func _on_MenuButton_pressed() -> void:
	popup_menu.popup_centered()


# Set text to TopText node
func set_top_text(new_text: String) -> void:
	top_text.text = new_text


# Load data of current save file
func load_game() -> void:
	save = SaveGame.load_savegame()
	
	character_button.visible = save.character_button_visibility
	inventory_button.visible = save.inventory_button_visibility
	journal_button.visible = save.journal_button_visibility
