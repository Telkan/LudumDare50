extends "res://Scripts/ScrollMovement.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var chosen = rng.randi_range(1,3)
	var texture = load("res://Decors/Clouds/"+str(chosen)+".png")
	texture.set_flags(2)
	get_node("Sprite").set_texture(texture)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta)
	pass
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
