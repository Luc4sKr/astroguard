extends Node2D


func _ready():
	pass

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var angle = atan2(direction.y, direction.x)
	rotation_degrees = angle * 180 / PI
