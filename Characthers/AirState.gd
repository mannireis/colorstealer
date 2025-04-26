extends State

class_name AirState

@onready var dash_timer : Timer = $DashTimer

@export var landing_state : State
@export var double_jump_velocity : float = -100
@export var double_jump_animation : String = "double_jump"
@export var landing_animation : String = "jump_end"
@export var wall_jump_x_velocity : float = 300
@export var wall_jump_y_velocity : float = -400
@export var wall_slide_friction : float = 100


var has_double_jumped = false
var has_wall_jumped = false
var is_wall_sliding = false


func state_process(delta):
	if(player.is_on_floor()):
		next_state = landing_state
	wall_slide(delta)


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		if (player.is_on_wall()):
			player.velocity.y = wall_jump_y_velocity
			playback.travel("jump_start")
	if(event.is_action_pressed("jump") && !has_double_jumped && !player.is_on_wall()):
		double_jump()


func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jumped = false


func double_jump():
	player.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	has_double_jumped = true
	
func wall_slide(delta):
	if player.is_on_wall():
		if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
			is_wall_sliding = true
			playback.travel("wall_slide")
		else:
			is_wall_sliding = false
	else:
		is_wall_sliding = false
	if is_wall_sliding:
		player.velocity.y += (wall_slide_friction * delta)
		player.velocity.y = min(player.velocity.y, wall_slide_friction)


	
