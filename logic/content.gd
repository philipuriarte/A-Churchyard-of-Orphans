extends VBoxContainer

const ContentData = preload("res://logic/content_data.gd")

var content_dict : Dictionary = ContentData.new().get_content_dict()
var current_page : String

# Variables that contain nodes
onready var title_label: Label = $"%TitleLabel"
onready var narr_text : RichTextLabel = $"%NarrativeText"
onready var choices_con : VBoxContainer = $"%ChoicesContainer"
onready var choice_1 : Button = $"%Choice1"
onready var choice_2 : Button = $"%Choice2"
onready var choice_3 : Button = $"%Choice3"
onready var choice_4 : Button = $"%Choice4"


# Sets starting content "prologue" and connects signals to Choice buttons
func _ready() -> void:
	set_content("000_prologue")
	
# warning-ignore:return_value_discarded
	choice_1.connect("pressed", self,"_on_Choice_btn_pressed", [1])
# warning-ignore:return_value_discarded
	choice_2.connect("pressed", self,"_on_Choice_btn_pressed", [2])
# warning-ignore:return_value_discarded
	choice_3.connect("pressed", self,"_on_Choice_btn_pressed", [3])
# warning-ignore:return_value_discarded
	choice_4.connect("pressed", self,"_on_Choice_btn_pressed", [4])


# Functions for checking if any of the Choice buttons were released
func _on_Choice_btn_pressed(choice_index: int) -> void:
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
# Alternatively narr_text.bbcode_text += new_text + "\n\n" to only append text
func set_narr_text(new_text: String) -> void:
	narr_text.bbcode_text = new_text


# Sets visibility and text of Choice buttons
func set_choice_btn(output_key: String) -> void:
	for choice_i in choices_con.get_children():
		choice_i.text = ""
		choice_i.visible = false
	
	for choice in content_dict[output_key]["choices"]:
		match choice:
			1:
				choice_1.text = content_dict[output_key]["choices"][choice]["text"]
				choice_1.visible = true
			2:
				choice_2.text = content_dict[output_key]["choices"][choice]["text"]
				choice_2.visible = true
			3:
				choice_3.text = content_dict[output_key]["choices"][choice]["text"]
				choice_3.visible = true
			4:
				choice_4.text = content_dict[output_key]["choices"][choice]["text"]
				choice_4.visible = true

