extends VBoxContainer

var choice_index := 0
var content_dict : Dictionary = {
	"prologue": {
		"narr_text": "You are the son/daughter of Lord *insert name* of *insert place*",
		"choices_text": {
			1: {
				"text": "Continue",
				"output": "intro"
			}
		}
	},
	"intro": {
		"narr_text": "You wake up to the sudden knock to your room.",
		"choices_text": {
			1: "Open the door",
			2: "Ask who it is"
		}
	}
}

# Variables that contain nodes
onready var narr_text = $NarrativeText
onready var choice_1 = $ChoicesMargin/ChoicesContainer/Choice1
onready var choice_2 = $ChoicesMargin/ChoicesContainer/Choice2
onready var choice_3 = $ChoicesMargin/ChoicesContainer/Choice3
onready var choice_4 = $ChoicesMargin/ChoicesContainer/Choice4


func _ready() -> void:
	set_narr_text(content_dict["prologue"]["text"])


func set_narr_text(new_text: String):
	narr_text.text = new_text


func set_choice_btn_text():
	choice_1.text = "Continue"


# Sets visibility and text of choice buttons, sets text of NarrativeText
func choice_output(result: int) -> void:
	set_narr_text("You chose choice #" + result as String)


# Functions for checking if any of the Choice buttons were released
func _on_Choice1_button_up() -> void:
	choice_index = 1
	choice_output(choice_index)


func _on_Choice2_button_up() -> void:
	choice_index = 2
	choice_output(choice_index)


func _on_Choice3_button_up() -> void:
	choice_index = 3
	choice_output(choice_index)


func _on_Choice4_button_up() -> void:
	choice_index = 4
	choice_output(choice_index)
