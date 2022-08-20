extends PanelContainer

export var choice_index: int = 0


# Return the value of choice_index
func _on_ChoiceButton_pressed() -> int:
	return choice_index
