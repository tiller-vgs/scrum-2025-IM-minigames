extends Node2D

var curent_enemy = null
var txt_index := -1
@onready var enemys = $enemys
func get_enemy(typed: String):
	for enemy in enemys.get_children():
		if enemy.get_prompt().substr(0, 1) == typed:
			curent_enemy = enemy
			txt_index = 1

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventKey and event.is_pressed() and not event.is_echo():
			var key_typed = PackedByteArray([event.unicode]).get_string_from_utf8()
			print(str("you typed: ") + key_typed)
			if curent_enemy == null:
				get_enemy(key_typed)
			else:
				if key_typed == curent_enemy.get_prompt().substr(txt_index, 1):
					txt_index += 1
					if txt_index == curent_enemy.get_prompt().length():
						txt_index = -1
						# TODO:kill enemy
						print("yipi")
						curent_enemy = null
