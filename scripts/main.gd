extends Node2D


func _ready():
	Global.parent_node_creation = self


func _exit_tree():
	Global.parent_node_creation = null


func _on_enemy_spawn_timer_timeout():
	pass # Replace with function body.
