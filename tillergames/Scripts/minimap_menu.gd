extends Control



func _on_casino_pressed():
	get_tree().change_scene_to_file("res://Scenes/casino.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")


func _on_war_room_pressed():
	get_tree().change_scene_to_file("res://Scenes/warroom.tscn")
