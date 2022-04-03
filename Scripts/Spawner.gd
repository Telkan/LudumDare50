extends Node2D

export (Array, PackedScene) var scenes

var rng = RandomNumberGenerator.new()
export var meanSpawnDistance = 500
export var spawnDistanceRadomization = 0.5
var distanceToSpawn = 0
var traveledDistance = 0

func _ready():
	rng.randomize()
	distanceToSpawn = meanSpawnDistance * rng.randf_range(spawnDistanceRadomization,1)
	
func _process(delta):
	traveledDistance += delta*Globals.travelSpeed
	if traveledDistance>= distanceToSpawn:
		distanceToSpawn = meanSpawnDistance * rng.randf_range(spawnDistanceRadomization,1)
		var tmp = scenes[rng.randi_range(0,scenes.size()-1)].instance()
		add_child(tmp)
		traveledDistance = 0
