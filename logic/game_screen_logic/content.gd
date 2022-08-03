extends VBoxContainer

var choice_index := 0
var current_page = "prologue"
var output_key : String = " "
var content_dict : Dictionary = {
	"prologue": {
		"narr_text": "You are the son/daughter of Lord *insert name* of *insert place*",
		"choices": {
			1: {
				"text": "Continue",
				"output": "intro"
			}
		}
	},
	"intro": {
		"narr_text": "You wake up to the sudden knock to your room.",
		"choices": {
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
	set_content("prologue")


func set_narr_text(new_text: String):
	narr_text.text = new_text


func set_choice_btn(key: String):
	for choice in content_dict[key]["choices"]:
		match choice:
			1:
				choice_1.text = content_dict[key]["choices"][choice]["text"]
				choice_1.visible = true
				continue
			2:
				choice_2.text = content_dict[key]["choices"][choice]["text"]
				choice_2.visible = true
				continue
			3:
				choice_3.text = content_dict[key]["choices"][choice]["text"]
				choice_3.visible = true
				continue
			4:
				choice_4.text = content_dict[key]["choices"][choice]["text"]
				choice_4.visible = true
				continue
			_:
				break


# Sets visibility and text of choice buttons, sets text of NarrativeText
func set_content(key: String) -> void:
	set_narr_text(content_dict[key]["narr_text"])
	set_choice_btn(key)


# Functions for checking if any of the Choice buttons were released
func _on_Choice1_button_up() -> void:
	choice_index = 1
	output_key = content_dict[current_page]["choices"][choice_index]["output"]
	set_content(output_key)


func _on_Choice2_button_up() -> void:
	choice_index = 2
	output_key = content_dict[current_page]["choices"][choice_index]["output"]
	set_content(output_key)


func _on_Choice3_button_up() -> void:
	choice_index = 3
	output_key = content_dict[current_page]["choices"][choice_index]["output"]
	set_content(output_key)


func _on_Choice4_button_up() -> void:
	choice_index = 4
	output_key = content_dict[current_page]["choices"][choice_index]["output"]
	set_content(output_key)
