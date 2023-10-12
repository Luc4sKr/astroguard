extends Sprite2D


var bullet = preload("res://scenes/bullet.tscn")

var is_reloaded = true
var damage = 50

func _ready():
	Global.player = self
	
func _exit_tree():
	Global.player = null

func _process(delta):
	rotate_by_mouse()
	shoot()

func _on_reload_time_timeout():
	is_reloaded = true 

func rotate_by_mouse():
	var mouse_position = get_viewport().get_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var angle = atan2(direction.y, direction.x)
	rotation_degrees = angle * 180 / PI
	
func shoot():
	if Input.is_action_pressed("shoot") and is_reloaded:
		if Global.parent_node_creation != null:
			Global.instance_node(bullet, $shoot_spawn.global_position, Global.parent_node_creation)
			
			is_reloaded = false
			$reload_time.start()

func _on_hitbox_area_entered(area):
	if area.is_in_group("enemy"):
		visible = false
		# fazer um temporizador aqui
		get_tree().reload_current_scene()
		
