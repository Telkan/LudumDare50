extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var runSpeed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_node("RigidBody2D").set_linear_velocity(Vector2(-runSpeed*delta,0))
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
