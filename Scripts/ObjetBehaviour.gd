extends "res://Scripts/ScrollMovement.gd"

func _physics_process(delta):
	move(delta)
	

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("rewardplayer",1)
		queue_free()
