extends Node2D

var vel = 500

func _ready():
	set_process(true)

func _process(delta):
	self.position = self.position + Vector2(0, -1) * vel * delta
