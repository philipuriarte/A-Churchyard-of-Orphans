extends VBoxContainer

const ContentData = preload("res://logic/content_data.gd")

var content_dict = ContentData.new().get_content_dict()
var current_page := "prologue"

# Variables that contain nodes
onready var narr_text = $NarrativeText
onready var choice_1 = $ChoicesMargin/ChoicesContainer/Choice1
onready var choice_2 = $ChoicesMargin/ChoicesContainer/Choice2
onready var choice_3 = $ChoicesMargin/ChoicesContainer/Choice3
onready var choice_4 = $ChoicesMargin/ChoicesContainer/Choice4


# Sets starting content "prologue" and connects signals to Choice buttons
func _ready() -> void:
	set_content("000_prologue")
	choice_1.connect("pressed", self,"_on_Choice_btn_pressed", [1])
	choice_2.connect("pressed", self,"_on_Choice_btn_pressed", [2])
	choice_3.connect("pressed", self,"_on_Choice_btn_pressed", [3])
	choice_4.connect("pressed", self,"_on_Choice_btn_pressed", [4])


# Functions for checking if any of the Choice buttons were released
func _on_Choice_btn_pressed(choice_index: int):
	var output_key: String
	if content_dict[current_page]["choices"][choice_index].has("output"):
		output_key = content_dict[current_page]["choices"][choice_index]["output"]
		set_content(output_key)


# Updates the nodes in ContentContainer and value of current_page
func set_content(output_key: String) -> void:
	current_page = output_key
	set_narr_text(content_dict[output_key]["narr_text"])
	set_choice_btn(output_key)


# Sets text of NarrativeText
func set_narr_text(new_text: String):
	narr_text.bbcode_text = new_text
	# alternatively narr_text.bbcode_text += new_text + "\n\n" to only append text


# Sets visibility and text of Choice buttons
func set_choice_btn(output_key: String):
	choice_1.visible = false
	choice_2.visible = false
	choice_3.visible = false
	choice_4.visible = false
	for choice in content_dict[output_key]["choices"]:
		match choice:
			1:
				choice_1.text = content_dict[output_key]["choices"][choice]["text"]
				choice_1.visible = true
				continue
			2:
				choice_2.text = content_dict[output_key]["choices"][choice]["text"]
				choice_2.visible = true
				continue
			3:
				choice_3.text = content_dict[output_key]["choices"][choice]["text"]
				choice_3.visible = true
				continue
			4:
				choice_4.text = content_dict[output_key]["choices"][choice]["text"]
				choice_4.visible = true
				continue

