extends Node2D

func _ready():
	pass # Replace with function body.

func move(delta):
	self.position.x-= Globals.travelSpeed*delta
