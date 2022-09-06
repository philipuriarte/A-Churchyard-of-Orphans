class_name SaveGame
extends Resource

const SAVE_GAME_PATH := "user://save_game"

# Game data to save
export(String) var current_scene
export(Array) var inventory
export(String) var top_text
export(bool) var character_button_visibility
export(bool) var inventory_button_visibility
export(bool) var journal_button_visibility


# Save game
func write_savegame() -> void:
	# warning-ignore:return_value_discarded
	ResourceSaver.save(get_save_path(), self)


# Check if a save file exists
static func save_exists() -> bool:
	return ResourceLoader.exists(get_save_path())


# Load game
static func load_savegame() -> Resource:
	return ResourceLoader.load(get_save_path(), "", true)


# Save and load a text resource in debug builds and a binary resource in the released product
static func get_save_path() -> String:
	var extension := ".tres" if OS.is_debug_build() else ".res"
	return SAVE_GAME_PATH + extension
