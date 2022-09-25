extends PanelContainer

# Create custom signal to be able to call in story_display.tscn
signal choice_btn_pressed(choice_index)

var choice_index: int

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
