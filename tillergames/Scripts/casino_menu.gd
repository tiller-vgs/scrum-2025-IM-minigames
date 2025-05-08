extends Control

func _on_blackjack_pressed():
	get_tree().change_scene_to_file("res://Scenes/blackjack.tscn")

func _on_leave_pressed():
	get_tree().change_scene_to_file("res://Scenes/minimap_menu.tscn")
