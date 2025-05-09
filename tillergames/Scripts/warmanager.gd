extends Node

@onready var animation_player: AnimationPlayer = $"../camara_top/AnimationPlayer"
@onready var camara_top: Camera3D = $"../camara_top"
@onready var camara_side: Camera3D = $"../camara_side"
var pos = 0

func _input(event):
	if event.is_action_pressed("debug_o"):
		if pos == 0:
			animation_player.play("camara_top-side")
			pos = 1
		else:
			animation_player.play_backwards("camara_top-side")
			pos = 0
