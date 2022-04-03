extends "res://Scripts/ScrollMovement.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	self.position.y -= rng.randi_range(0,150)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	Globals.heartRate = 0
	queue_free()
	pass # Replace with function body.


func _physics_process(delta):
	move(delta)
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
