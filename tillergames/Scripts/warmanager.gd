extends Node

@onready var camara_top: Camera3D = $"../camara_top"
@onready var camara_side: Camera3D = $"../camara_side"


func _input(event):
	if event.is_action_pressed("debug_o"):
		if camara_top.current == true:
			camara_top.current = false
			camara_side.current = true
		else:
			camara_top.current = true
			camara_side.current = false
