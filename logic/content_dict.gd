extends Node

class_name ContentDict

# Dictionary that contains all the text content of the game
var content_dict := {
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
			1: {
				"text": "Open the door",
				"output": "open_door"
			},
			2: {
				"text": "Ask who it is",
				"output": "ask_who"
			}
		}
	},
	
	"open_door": {
		"narr_text": "You open the door and find a servant.",
		"choices": {
			1: {
				"text": "Test1"
			},
			2: {
				"text": "Test2"
			},
			3: {
				"text": "Test3"
			}
		}
	},
	
	"ask_who": {
		"narr_text": "You ask who is it. A servant replies to you",
		"choices": {
			1: {
				"text": "Test1"
			},
			2: {
				"text": "Test2"
			},
			3: {
				"text": "Test3"
			},
			4: {
				"text": "Test4"
			}
		}
	}
	
}


# Returns the valuee of content_dict
func get_cd():
	return content_dict
