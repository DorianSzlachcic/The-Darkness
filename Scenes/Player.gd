extends KinematicBody2D

const MAX_SPEED = 70
const ACCELERATION = 700
const GRAVITY = 950

enum{
	MOVE,
	CLIMB,
	END_LVL
}

var state = MOVE

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
var mouse_position = null

onready var sprite = $Sprite
onready var audio = $AudioStreamPlayer2D

func _physics_process(delta):
	match state:
		MOVE:
			moving(delta)
			jumping(delta)
			gravity(delta)
		CLIMB:
			moving(delta)
			climbing_on_ladder(delta)
		END_LVL:
			pass
	
	
	if Input.is_action_just_pressed("light"):
		sprite.frame = 1
	if Input.is_action_just_released("light"):
		sprite.frame = 0

func moving(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity = velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
	velocity = move_and_slide(velocity,Vector2(0,-1))
	
	mouse_position = get_global_mouse_position()
	if mouse_position.x < global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func gravity(delta):
	velocity.y += GRAVITY * delta

func jumping(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -14000 * delta
			audio.play(0)

func climbing_on_ladder(delta):
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	velocity = velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)

