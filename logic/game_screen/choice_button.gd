extends PanelContainer

# Create custom signal to be able to call in content.tscn
signal choice_btn_pressed(choice_index)

# Export variable that will only accept integers 1, 2, 3, 4
export(int, 1, 4) var choice_index: int = 1

onready var choice_text: Label = $"%ChoiceText"


# Emit choice_btn_pressed signal when ChoiceButton is pressed
func _on_ChoiceButton_pressed():
	emit_signal("choice_btn_pressed", choice_index)


# Set choice_index
func set_choice_index(index: int) -> void:
	choice_index = index


# Set text to ChoiceText
func set_choice_text(new_text: String) -> void:
	choice_text.text = new_text
