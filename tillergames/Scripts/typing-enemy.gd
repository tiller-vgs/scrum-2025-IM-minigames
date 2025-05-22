extends Sprite2D
@onready var promp = $RichTextLabel
@onready var prompt = promp.get_parsed_text().strip_edges()

var color_success = Color(0,0.5,0,1)
var color_fail = Color(0.5,0,0,1)
var speed = 5

func _physics_process(delta: float) -> void:
	global_position.x -= speed*delta


func get_prompt() -> String:
	return prompt

func set_color(txt_index, wrong):
	var todo_txt = ""
	var done_txt = "[color=#" + color_success.to_html() + "]"+ prompt.substr(0,txt_index-1) +"[/color]"
	if wrong == true:
		todo_txt = "[color=#"+color_fail.to_html()+"]"+prompt.substr(txt_index,1)+"[/color]"+prompt.substr(txt_index+1, (prompt.length()-txt_index)-1)
	else:
		todo_txt = prompt.substr(txt_index, prompt.length()-txt_index)
	promp.parse_bbcode("[center]"+done_txt + todo_txt+"[/center]")
