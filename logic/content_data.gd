class_name ContentData

# Dictionary that contains all the text content of the game
var content_dict := {
	"000_prologue": {
		"narr_text": "You are the son/daughter of Lord *insert name* of *insert place*",
		"choices": {
			1: {
				"text": "Continue",
				"output": "001_intro"
			}
		}
	},
	
	"001_intro": {
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
				"text": "Follow the servant quietly"
			},
			2: {
				"text": "Ask who's attacking the castle"
			},
			3: {
				"text": "Bring a long sword with you"
			}
		}
	},
	
	"001_ask_who": {
		"narr_text": "You ask who is it. But you're replied with another knock.",
		"choices": {
			1: {
				"text": "Open the door carefully"
			},
			2: {
				"text": "Ask again"
			},
		}
	}
	
}


# Returns the valuee of content_dict
func get_content_dict():
	return content_dict
