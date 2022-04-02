extends Node2D

export var scroll_speed = 2.5

func _ready():
	pass # Replace with function body.

func move():
	self.position.x-=scroll_speed
