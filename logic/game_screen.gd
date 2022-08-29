extends PanelContainer

var save_game: SaveGame

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
func set_save_top_text(new_text: String) -> void:
	save_game = SaveGame.load_savegame()	
	top_text.text = new_text
	save_game.top_text = new_text
	save_game.write_savegame()

# Set and save visibility of BottomContainer buttons
func set_save_bottom_btns(button: String, visibility: bool) -> void:
	save_game = SaveGame.load_savegame()
	
	match button:
		"character":
			character_button.visible = visibility
			save_game.character_button_visibility = visibility
		"inventory":
			inventory_button.visible = visibility
			save_game.inventory_button_visibility = visibility
		"journal":
			journal_button.visible = visibility
			save_game.journal_button_visibility = visibility
	
	save_game.write_savegame()


# Load data of current save file
func load_game() -> void:
	save_game = SaveGame.load_savegame()
	
	top_text.text = save_game.top_text
	character_button.visible = save_game.character_button_visibility
	inventory_button.visible = save_game.inventory_button_visibility
	journal_button.visible = save_game.journal_button_visibility
