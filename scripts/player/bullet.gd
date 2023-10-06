extends Node2D

var mov = Vector2(1, 0)
var speed = 250
var single_direction = true

func _ready():
	pass

func _process(delta: float) -> void:
	if single_direction:
		look_at(get_global_mouse_position())
		single_direction = false
	
	global_position += mov.rotated(rotation) * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
