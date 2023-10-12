extends Node2D


@onready var anim = $"animation";

func _ready():
	anim.play("explode")

func _process(delta):
	pass

func _on_animation_finished():
	queue_free()
