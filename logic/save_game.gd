class_name SaveGame
extends Resource

const SAVE_GAME_PATH := "user://save.tres"

# Game data to save
export(String) var current_page
export(Array) var inventory


func write_savegame() -> void:
	# warning-ignore:return_value_discarded
	ResourceSaver.save(SAVE_GAME_PATH, self)
