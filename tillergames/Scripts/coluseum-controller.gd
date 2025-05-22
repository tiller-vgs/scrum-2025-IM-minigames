extends Node2D

var ENEMY = preload("res://item-scenes/enemy.tscn")

var curent_enemy = null
var txt_index := -1
@onready var enemys = $enemys
@onready var spwn_timer = $Timer

func _ready() -> void:
	randomize()
	spwn_timer.start()
	spwn_enemy()

func _unhandled_input(event: InputEvent) -> void:
	print("hu")	
	if event is InputEventKey and event.is_pressed() and not event.is_echo():	
		var key_typed = PackedByteArray([event.unicode]).get_string_from_utf8()
		print(str("you typed: ") + key_typed)
		if curent_enemy == null:
			get_enemy(key_typed)
		else:
			print(curent_enemy)
			if key_typed == curent_enemy.get_prompt().substr(txt_index, 1):
				txt_index += 1
				curent_enemy.set_color(txt_index,false)
				if txt_index == curent_enemy.get_prompt().length():
					txt_index = -1
					# TODO:kill enemy
					curent_enemy.queue_free()
					curent_enemy = null
			else:
				curent_enemy.set_color(txt_index,true)
	
func get_enemy(typed: String):
	for enemy in enemys.get_children():
		if enemy.get_prompt().substr(0, 1) == typed:
			curent_enemy = enemy
			txt_index = 1
			curent_enemy.set_color(txt_index,false)
			print(curent_enemy.global_position)
			return

func spwn_enemy():
	#x = 1120 y = 0 -- 600	
	var new_enemy = ENEMY.instantiate() 
	var spawn_point = randi() % 60
	enemys.add_child(new_enemy)
	new_enemy.global_position.y = spawn_point*10
	new_enemy.global_position.x = 1120	

func _on_timer_timeout() -> void:
	spwn_enemy()

var list = [
"word",
"list",
]

func gen_prompt(amount:int) -> String:
	var string := ""
	for i in amount:
		var list_index = randi() % list.size()
		string += ""
		string += list[list_index]
	return string
