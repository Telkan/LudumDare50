extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var random_timer = RandomNumberGenerator.new()
var selected_scene_index = 0

func _on_Timer_timeout():
	random_scene.randomize()
	random_timer.randomize()
	get_node("Timer").set_wait_time(random_timer.randf_range(0,2))
	selected_scene_index = random_scene.randi_range(0,1)
	var tmp = scenes[selected_scene_index].instance()
	add_child(tmp)
