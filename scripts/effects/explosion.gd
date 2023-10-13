extends AnimatedSprite2D


func _ready():
	self.play("explode")


func _on_animation_finished():
	queue_free()
