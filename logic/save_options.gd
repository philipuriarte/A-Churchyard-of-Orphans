class_name SaveOptions
extends Resource

const SAVE_GAME_PATH := "user://save_options"

# Options data to save
export(int, "English") var language
export(bool) var music_on
export(bool) var sfx_on
export(int, "10", "11", "12", "13" ,"14") var font_size
export(int, "10", "12", "14", "16", "18") var line_spacing


# Save options
func write_saveoptions() -> void:
	# warning-ignore:return_value_discarded
	ResourceSaver.save(get_save_path(), self)


# Check if save_options file exists
static func save_exists() -> bool:
	return ResourceLoader.exists(get_save_path())


# Load options
static func load_saveoptions() -> Resource:
	return ResourceLoader.load(get_save_path(), "", true)


# Save and load a text resource in debug builds and a binary resource in the released product
static func get_save_path() -> String:
	var extension := ".tres" if OS.is_debug_build() else ".res"
	return SAVE_GAME_PATH + extension
