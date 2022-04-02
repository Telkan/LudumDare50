extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var chosen = rng.randi_range(1,4)
	var texture = load("res://Decors/Maison/"+str(chosen)+".png")
	texture.set_flags(2)
	get_node("Sprite").set_texture(texture)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
