extends Node2D


func _ready():
	Global.parent_node_creation = self


func _exit_tree():
	Global.parent_node_creation = null
