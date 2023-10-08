extends Node2D


var enemy = preload("res://scenes/enemy.tscn")

func _ready():
	Global.parent_node_creation = self

func _exit_tree():
	Global.parent_node_creation = null

func _on_enemy_spawn_timer_timeout():
	var enemy_pos = generate_random_position(Global.screen_width, Global.screen_height)
	
	while is_inside_screen(enemy_pos, Global.screen_width, Global.screen_height):
		enemy_pos = generate_random_position(Global.screen_width, Global.screen_height)
	Global.instance_node(enemy, enemy_pos, self)
	
func generate_random_position(screen_width, screen_height):
	var px = randf_range(-100, screen_width + 100)
	var py = randf_range(-100, screen_height + 100)
	return Vector2(px, py)
	
func is_inside_screen(position, screen_width, screen_height):
	return position.x > 0 and position.x < screen_width and position.y > 0 and position.y < screen_height
