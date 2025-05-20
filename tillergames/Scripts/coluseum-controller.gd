extends Node2D

var ENEMY = preload("res://item-scenes/enemy.tscn")

var curent_enemy = null
var txt_index := -1
@onready var enemys = $enemys
func get_enemy(typed: String):
	for enemy in enemys.get_children():
		if enemy.get_prompt().substr(0, 1) == typed:
			curent_enemy = enemy
			txt_index = 1
			curent_enemy.set_color(txt_index,false)
			print(curent_enemy.global_position)
			return

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventKey and event.is_pressed() and not event.is_echo():
			var key_typed = PackedByteArray([event.unicode]).get_string_from_utf8()
			print(str("you typed: ") + key_typed)
			if curent_enemy == null:
				get_enemy(key_typed)
			else:
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


func _on_timer_timeout() -> void:
	#x = 1120 y = 0 -- 600
	var new_enemy = ENEMY.instance()
	var spawn_point = randi() % 600
	new_enemy.global_position.y = spawn_point
	enemys.add_child(new_enemy)
	new_enemy.global_position.x = 1120
