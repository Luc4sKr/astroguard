extends Sprite2D

var explosion = preload("res://scenes/explosion.tscn")

var mov = Vector2.ZERO
var speed = 75
var life = 100

func _process(delta):
	movement(delta)
	check_life()

func _on_hitbox_area_entered(area):
	if area.is_in_group("damage"):
		area.get_parent().queue_free()
		life -= Global.player.damage
		
func movement(delta):
	if Global.player != null:
		mov = global_position.direction_to(Global.player.global_position)
		rotate_by_player()
	global_position += mov * speed * delta
	
func rotate_by_player():
	var direction = (Global.player.global_position - global_position).normalized()
	var angle = atan2(direction.y, direction.x)
	rotation_degrees = angle * 180 / PI
	
func check_life():
	if life <= 0:
		queue_free()
		Global.instance_node(explosion, global_position, Global.parent_node_creation)

