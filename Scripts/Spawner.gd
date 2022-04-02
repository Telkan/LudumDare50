extends Node2D

export (Array, PackedScene) var scenes

var random_timer = RandomNumberGenerator.new()

func _on_Timer_timeout():
	random_timer.randomize()
	get_node("Timer").set_wait_time(random_timer.randf_range(0,2))
	var tmp = scenes[random_timer.randi_range(0,scenes.size()-1)].instance()
	add_child(tmp)
