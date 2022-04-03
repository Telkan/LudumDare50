extends Node2D

export (Array, PackedScene) var scenes
export var spawnDistance = 50
var distanceTraveled = 0

func _process(delta):
	distanceTraveled += delta * Globals.travelSpeed
	if (distanceTraveled >= spawnDistance):
		var tmp = scenes[0].instance()
		tmp.setSpeed(Globals.travelSpeed)
		add_child(tmp)
		distanceTraveled=0
