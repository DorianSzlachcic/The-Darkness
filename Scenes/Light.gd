extends Position2D

onready var light = $Light2D
onready var light2 = $Light2D2
onready var audio = $AudioStreamPlayer2D

var battery = 100

enum{
	MOVE,
	CLIMB,
	END_LVL
}

func _ready():
	light.enabled = false
	light2.enabled = false

func _process(_delta):
	battery = get_parent().get_parent().get_node("HUD/ColorRect2").rect_size.x
	look_at(get_global_mouse_position())
	if battery!=0:
		if Input.is_action_just_pressed("light"):
			if get_parent().state != END_LVL:
				audio.play(0)
		if Input.is_action_pressed("light"):
			light.enabled = true
			light2.enabled = true
		if Input.is_action_just_released("light"):
			light.enabled = false
			light2.enabled = false
	else:
		light.enabled = false
		light2.enabled = false
