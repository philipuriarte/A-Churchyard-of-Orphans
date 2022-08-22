extends PanelContainer

signal choice_btn_pressed(choice_index)

export(int, 1, 4) var choice_index: int = 1

onready var choice_text: Label = $"%ChoiceText"


# Return the value of choice_index
func _on_ChoiceButton_pressed():
	emit_signal("choice_btn_pressed", choice_index)


# Set text to ChoiceText
func set_text(new_text: String) -> void:
	choice_text.text = new_text
