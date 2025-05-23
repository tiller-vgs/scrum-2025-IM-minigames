extends Sprite2D
@onready var prompt = $RichTextLabel

var color_success = Color(0,0.5,0,1)
var color_fail = Color(0.5,0,0,1)
var speed = 5

func _ready() -> void:
	prompt.text = PromptList.gen_prompt(1)
	prompt.parse_bbcode("[center]"+prompt.text+"[/center]")

func _physics_process(delta: float) -> void:
	global_position.x -= speed*delta


func get_prompt() -> String:
	return str(prompt.get_parsed_text().strip_edges())

func set_color(txt_index, wrong):
	var striped_prompt = prompt.get_parsed_text().strip_edges()
	print(striped_prompt)
	print(txt_index)
	var todo_txt = ""
	var done_txt = ("[color=#" + color_success.to_html() + "]"+ striped_prompt.substr(0,txt_index) +"[/color]")
	if wrong == true:
		todo_txt = ("[color=#"+color_fail.to_html()+"]"+striped_prompt.substr(txt_index,1)+"[/color]"+striped_prompt.substr(txt_index+1, (striped_prompt.length()-txt_index)-1))
	else:
		todo_txt = (striped_prompt.substr(txt_index, striped_prompt.length()-txt_index))
	print(done_txt + " yab " + todo_txt)
	prompt.parse_bbcode("[center]"+done_txt + todo_txt+"[/center]")
