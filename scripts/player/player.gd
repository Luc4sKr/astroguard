extends Node2D

#var global = load("res://scripts/player/global.gd")
var bullet = preload("res://scenes/bullet.tscn")
var global

func _ready():
	global = load("res://scripts/player/global.gd")

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var angle = atan2(direction.y, direction.x)
	rotation_degrees = angle * 180 / PI
	
	if Input.is_action_just_pressed("shoot"):
		global.instance_node(bullet, global_position, get_parent())
