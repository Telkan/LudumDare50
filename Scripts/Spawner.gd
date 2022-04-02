extends Node2D

export (Array, PackedScene) var scenes

var random_timer = RandomNumberGenerator.new()

func _on_Timer_timeout():
	random_timer.randomize()
	get_node("Timer").set_wait_time(random_timer.randf_range(0,2))
	var tmp = scenes[0].instance()
	add_child(tmp)
