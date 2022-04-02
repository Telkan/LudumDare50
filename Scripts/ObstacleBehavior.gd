extends "res://Scripts/ScrollMovement.gd"

func _physics_process(delta):
	move()

func _on_ObstacleBlock_body_entered(body):
	if body.name == "Player":
		queue_free()
		Signals.emit_signal("killplayer")
