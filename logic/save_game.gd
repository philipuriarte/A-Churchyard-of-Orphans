class_name SaveGame
extends Resource

const SAVE_GAME_PATH := "user://save.tres"

# Game data to save
export(String) var current_page
export(Array) var inventory


# Save game
func write_savegame() -> void:
	# warning-ignore:return_value_discarded
	ResourceSaver.save(get_save_path(), self)


# Check if a save file exists
func save_exists() -> bool:
	return ResourceLoader.exists(get_save_path())


# Load game
func load_savegame() -> Resource:
	return ResourceLoader.load(get_save_path(), "", true)


# Save and load a text resource in debug builds and a binary resource in the released product
func get_save_path() -> String:
	var extension := ".tres" if OS.is_debug_build() else ".res"
	return SAVE_GAME_PATH + extension
