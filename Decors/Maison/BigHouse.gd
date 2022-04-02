extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var runSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var chosen = rng.randi_range(1,4)
	var texture = load("res://Decors/Maison/"+str(chosen)+".png")
	texture.set_flags(2)
	get_node("Sprite").set_texture(texture)
	pass # Replace with function body.

func setSpeed(value):
	self.runSpeed = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(-runSpeed*delta,0))
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
