extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/minimap_menu.tscn")
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
