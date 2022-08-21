extends VBoxContainer

const ContentData = preload("res://logic/content_data.gd")

var content_dict: Dictionary = ContentData.new().get_content_dict()
var current_page: String

# Variables that contain nodes
onready var title_label: Label = $"%TitleLabel"
onready var narr_text: RichTextLabel = $"%NarrativeText"
onready var choices_con: VBoxContainer = $"%ChoicesContainer"
onready var choice_1: PanelContainer = $"%Choice1"
onready var choice_2: PanelContainer = $"%Choice2"
onready var choice_3: PanelContainer = $"%Choice3"
onready var choice_4: PanelContainer = $"%Choice4"


# Set starting content to "prologue" and connect signals to Choice buttons
func _ready() -> void:
	# Should be updated with saved current_page once save system is up
	set_content("000_prologue")


# Check if any of the Choice buttons were released
func _on_Choice_btn_pressed(choice_index: int) -> void:
	var output_key: String
	
	if content_dict[current_page]["choices"][choice_index].has("output"):
		output_key = content_dict[current_page]["choices"][choice_index]["output"]
		set_content(output_key)


# Update nodes in ContentContainer and current_page
func set_content(output_key: String) -> void:	
	set_title(output_key)
	set_narr_text(content_dict[output_key]["narr_text"])
	set_choice_btn(output_key)
	
	current_page = output_key


# Set visibiliy and text of TitleLabel
func set_title(output_key: String) -> void:
	if title_label.visible:
		title_label.text = ""
		title_label.visible = false
	
	if content_dict[output_key].has("title"):
		title_label.text = content_dict[output_key]["title"]
		title_label.visible = true


# Set text of NarrativeText
func set_narr_text(new_text: String) -> void:
	narr_text.bbcode_text = new_text


# Set visibility and text of Choice buttons
func set_choice_btn(output_key: String) -> void:
	for choice_i in choices_con.get_children():
		if choice_i.visible:
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

