extends Sprite2D

@onready var prompt = $RichTextLabel


func get_prompt() -> String:
	return prompt.get_parsed_text()
