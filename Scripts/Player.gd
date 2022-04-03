extends KinematicBody2D


#Jump 
export var max_speed := 200.0
export var fall_gravity_scale := 150.0
export var low_jump_gravity_scale := 100.0
export var jump_power := 1250.0
var jump_released = false

#Physics
var velocity = Vector2()
var earth_gravity = 9.807 
export var gravity_scale := 100.0
var on_floor = false

var score = 0
export var heartAmount = 0.1
export var heartRest = 0.005
var can_jump: bool = true


func _ready():
	Signals.connect("killplayer",self,"killplayer")
	Signals.connect("rewardplayer",self,"rewardplayer")

func _physics_process(delta):
	velocity.y += gravity_scale
	move_and_collide(velocity*delta)
	
	if Input.is_action_pressed(str("ui_left")):
		if Input.is_action_pressed(str("sprint")):
			velocity.x = -(max_speed*2)
			Globals.heartRate+=heartAmount*delta
		else:
			velocity.x = -max_speed
			
	elif Input.is_action_pressed(str("ui_right")):
		if Input.is_action_pressed(str("sprint")):
			velocity.x = (max_speed*2)
			Globals.heartRate+=heartAmount*delta
		else:
			velocity.x = max_speed
	else:
		velocity.x = 0
	
	if Input.is_action_just_released(str("ui_up")):
		Globals.heartRate+=heartAmount*delta
		jump_released = true
	
	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta
	
	if velocity.y > 0: #Player is falling
		velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta 
	
	elif velocity.y < 0 && jump_released: #Player is jumping 
		velocity += Vector2.DOWN * earth_gravity * low_jump_gravity_scale * delta
	
	if on_floor:
		if Input.is_action_just_pressed(str("ui_up")): 
			velocity = Vector2.UP * jump_power #Normal Jump action
			jump_released = false
	
	velocity = move_and_slide(velocity, Vector2.UP) 
	
	if is_on_floor(): 
		if on_floor == false:
			$"Particles2D".get_node("Particles2D").set_emitting(true)
		on_floor = true
	else: on_floor = false



func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		can_jump = true


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		can_jump = false

func killplayer():
	queue_free()
	
func rewardplayer(scoretoadd):
	score+=scoretoadd
	print(String(score))


func _on_Area2D_area_entered(area):
	killplayer()
	pass # Replace with function body.
