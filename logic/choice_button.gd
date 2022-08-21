extends PanelContainer

export(int, 1, 4) var choice_index: int = 1


# Return the value of choice_index
func _on_ChoiceButton_pressed() -> int:
	return choice_index
