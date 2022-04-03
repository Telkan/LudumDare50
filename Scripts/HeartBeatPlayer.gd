extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var restTime = 5
export var attackTime = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sound.set_paused(false)
	$Sound.start(restTime)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_volume_db(-10 + 10*Globals.heartRate)
	play()
	print(Globals.heartRate)
	$Sound.set_wait_time(restTime - Globals.heartRate * (restTime-attackTime))
	pass # Replace with function body.


func _on_Reduction_timeout():
	Globals.heartRate= abs(Globals.heartRate-$'..'.heartRest)
