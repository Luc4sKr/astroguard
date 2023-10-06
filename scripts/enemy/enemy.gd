extends Sprite2D


var mov = Vector2.ZERO
var speed = 75

var direction = null
var angle = null

func _ready():
	pass 

func _process(delta):
	if Global.player != null:
		mov = global_position.direction_to(Global.player.global_position)
		
		direction = (Global.player.global_position - global_position).normalized()
		angle = atan2(direction.y, direction.x)
		rotation_degrees = angle * 180 / PI
	
	global_position += mov * speed * delta
