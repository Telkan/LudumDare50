extends Node2D

export (Array, PackedScene) var scenes



func _on_Timer_timeout():
	var tmp = scenes[0].instance()
	tmp.setSpeed(Globals.travelSpeed)
	add_child(tmp)
	pass # Replace with function body.
