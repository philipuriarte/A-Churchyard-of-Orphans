class_name ContentData

# Dictionary that contains all the text content of the game
# Current text is only for the sole purpose of prototyping and is not indicative of the content in the final game
var content_dict: Dictionary = {
	"000_prologue": {
		"title": "Prologue",
		"narr_text": "You are the son/daughter of Lord *insert name* of *insert place*",
		"choices": {
			1: {
				"text": "Continue",
				"output": "001_intro"
			}
		}
	},
	
	"001_intro": {
		"title": "Chapter 1: On the Run",
		"narr_text": "You wake up to a sudden knock to your room. It's the middle of the night so you wonder who would wake you at this time...",
		"choices": {
			1: {
				"text": "Open the door",
				"output": "001_open_door"
			},
			2: {
				"text": "Ask who it is",
				"output": "001_ask_who"
			}
		}
	},
	
	"001_open_door": {
		"narr_text": "You open the door and find a male servant making a hush gesture. He whispers, \"M'lord the castle is under attack. I was tasked by Master *insert name* to guide you out.\"",
		"choices": {
			1: {
				"text": "Follow the servant quietly",
				"output": "001_follow_servant"
			},
			2: {
				"text": "Ask how are the defences holding up",
				"output": "001_ask_defences"
			},
			3: {
				"text": "Bring a longsword with you",
				"output": "001_follow_servant"
			}
		}
	},
	
	"001_ask_who": {
		"narr_text": "You ask who it is. But you're only replied with another knock. You start hearing faint noises of swords clashing outside...",
		"choices": {
			1: {
				"text": "Open the door carefully",
				"output": "001_follow_servant"
			},
			2: {
				"text": "Grab your longsword and ask one more time",
				"output": "001_grab_longsword"
			},
		}
	},
	
	"001_follow_servant": {
		"narr_text": "You take your longsword in your room and follow the servant quietly through the hallway.",
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
		"narr_text": "You ask \"How is the castle defences holding? Where's father and Master *insert name*?\"",
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
		"narr_text": "You quickly grab your longsword beside your bed and ask one more time. You hear a faint voice on the other side of the door. \"M'lord the castle is under attack. I was tasked by Master *insert name* to guide you out.\"",
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


# Return the valuee of content_dict
func get_content_dict() -> Dictionary:
	return content_dict
