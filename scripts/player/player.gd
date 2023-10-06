extends Sprite2D


var bullet = preload("res://scenes/bullet.tscn")

var is_reloaded = true

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var angle = atan2(direction.y, direction.x)
	rotation_degrees = angle * 180 / PI
	
	if Input.is_action_pressed("shoot") and is_reloaded:
		if Global.parent_node_creation != null:
			Global.instance_node(bullet, global_position, Global.parent_node_creation)
			
			is_reloaded = false
			$reload_time.start()

func _on_reload_time_timeout():
	is_reloaded = true 
