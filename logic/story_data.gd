class_name StoryData

# New dictionary format, will update old one soon
"""
var story_data: Dictionary = {
	"key": {
		"title": "title_text",
		"story_text": {
			"conditions": "insert_conditional_text",
			"default_text": "insert_story_text"
		},
		"choices": {
			1: {
				"conditions": "insert_conditions",
				"text": "insert_choice_text",
				"next_scene": "next_scene_key",
				"output": "insert_output"
			}
		}
	},
	
	"sample_scene": {
		"story_text": "The player decides what weapon to take in the house armory.",
		"choices": {
			1: {
				"text": "Take the longsword",
				"next_scene": "sample_grab_longsword",
				"output": {
					"type": "add_item",
					"value": "longsword"
				}
			},
			2: {
				"conditions": {
					"type": "have_item",
					"value": "family_key"
				},
				"text": "Take the family greatsword",
				"next_scene": "sample_grab_family_greatsword",
				"output": {
					"type": "add_item",
					"value": "family_greatsword"
				}
			}
		}
	}
}
"""
# Dictionary that contains all the story content of the game
# Current text is only for the sole purpose of prototyping and is not indicative of the story in the final game
var story_data: Dictionary = {
	"000_prologue": {
		"title": "Prologue",
		"story_text": "You are the son/daughter of Lord *insert name* of *insert place*",
		"choices": {
			1: {
				"text": "Continue",
				"next_scene": "001_intro"
			}
		}
	},
	
	"001_intro": {
		"title": "Chapter 1: On the Run",
		"story_text": "You wake up to a sudden knock to your room. It's the middle of the night so you wonder who would wake you at this time...",
		"choices": {
			1: {
				"text": "Open the door",
				"next_scene": "001_open_door"
			},
			2: {
				"text": "Ask who it is",
				"next_scene": "001_ask_who"
			}
		}
	},
	
	"001_open_door": {
		"story_text": "You open the door and find a male servant making a hush gesture. He whispers, \"M'lord the castle is under attack. I was tasked by Master *insert name* to guide you out.\"",
		"choices": {
			1: {
				"text": "Follow the servant quietly",
				"next_scene": "001_follow_servant"
			},
			2: {
				"text": "Ask how are the defences holding up",
				"next_scene": "001_ask_defences"
			},
			3: {
				"text": "Bring a longsword with you",
				"next_scene": "001_follow_servant",
				"output": {
					"type": "add_item",
					"value": "Longsword"
				}
			}
		}
	},
	
	"001_ask_who": {
		"story_text": "You ask who it is. But you're only replied with another knock. You start hearing faint noises of swords clashing outside...",
		"choices": {
			1: {
				"text": "Open the door carefully",
				"next_scene": "001_follow_servant",
				"output": {
					"type": "add_item",
					"value": "Longsword"
				}
			},
			2: {
				"text": "Grab your longsword and ask one more time",
				"next_scene": "001_grab_longsword",
				"output": {
					"type": "add_item",
					"value": "Longsword"
				}
			},
		}
	},
	
	"001_follow_servant": {
		"story_text": "You take your longsword in your room and follow the servant quietly through the hallway.",
		"choices": {
			1: {
				"text": "End of prototype"
			},
			2: {
				"text": "End of prototype"
			},
		}
	},
	
	"001_ask_defences": {
		"story_text": "You ask \"How is the castle defences holding? Where's father and Master *insert name*?\"",
		"choices": {
			1: {
				"text": "End of prototype"
			},
			2: {
				"text": "End of prototype"
			},
		}
	},
	
	"001_grab_longsword": {
		"story_text": "You quickly grab your longsword beside your bed and ask one more time. You hear a faint voice on the other side of the door. \"M'lord the castle is under attack. I was tasked by Master *insert name* to guide you out.\"",
		"choices": {
			1: {
				"text": "End of prototype"
			},
			2: {
				"text": "End of prototype"
			},
		}
	}
	
}


# Return story_data dictionary
func get_story_data() -> Dictionary:
	return story_data
