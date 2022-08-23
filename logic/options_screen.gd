extends PanelContainer

onready var popup_credits: Popup = $"%PopupCredits"
onready var test_text: Label = $"%TestText"


# Should set options to saved options
func _ready() -> void:
	pass

# Set language
func _on_LangOptions_item_selected(index: int) -> void:
	match index:
		0:
			print("User chose English")


# Set music on/off
func _on_MusicButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		print("User chose to turn on Music")
	else:
		print("User chose to turn off Music")


# Set sfx on/off
func _on_SFXButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		print("User chose to turn on SFX")
	else:
		print("User chose to turn off SFX")


# Set font size
func _on_SizeOptions_item_selected(index: int) -> void:
	match index:
		0:
			print("User chose font size 10")
		1:
			print("User chose font size 11")
		2:
			print("User chose font size 12")
		3:
			print("User chose font size 13")
		4:
			print("User chose font size 14")


# Set line spacing of text
func _on_LineOptions_item_selected(index: int) -> void:
	match index:
		0:
			print("User chose line spacing 10")
		1:
			print("User chose line spacing 12")
		2:
			print("User chose line spacing 14")
		3:
			print("User chose line spacing 16")
		4:
			print("User chose line spacing 18")


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


# Trigger when user presses ContactButton
func _on_ContactButton_pressed() -> void:
	print("User pressed Contact us")


# Change scene to title_screen
func _on_BackButton_pressed() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title_screen.tscn")
