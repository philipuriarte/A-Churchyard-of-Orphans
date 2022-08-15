extends PanelContainer

onready var popup_credits: Popup = $"%PopupCredits"


# Should set options to saved options
func _ready() -> void:
	pass


# Open PopupCredits
func _on_CreditsButton_pressed() -> void:
	popup_credits.popup_centered()


# Close PopupCredits
func _on_CloseButton_pressed() -> void:
	popup_credits.hide()


# Close PopupCredits if press/click event occurs outside CreditsScreen
func _on_PopupCredits_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			popup_credits.hide()


# Change scene to title_screen
func _on_BackButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")
