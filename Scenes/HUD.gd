extends CanvasLayer

var game_over = preload("res://Scenes/GameOver.tscn")
var sth = 0

enum{
	MOVE,
	CLIMB,
	END_LVL,

}

var state = MOVE

onready var battery_rect = $ColorRect2
onready var mental_rect = $ColorRect3
onready var delay_rect = $ColorRect4

signal mental_health_ended

func _ready():
	battery_rect.rect_size.x = 100
	mental_rect.rect_size.x = 100
	delay_rect.rect_size.x = 100

func _process(_delta):
	match state:
		MOVE:
			light_process()
		END_LVL:
			when_light_ended()
	
	if battery_rect.rect_size.x==0:
		state = END_LVL
	else:
		state = MOVE

func _on_HUD_mental_health_ended():
	if sth != 1:
		self.add_child(game_over.instance())
		get_parent().get_node("Player").state = END_LVL
	sth = 1

func light_process():
	if Input.is_action_pressed("light"):
		battery_rect.rect_size.x -= 0.2
		
		if delay_rect.rect_size.x <= 100:
			delay_rect.rect_size.x += 0.7
	else:
		if delay_rect.rect_size.x >= 0:
			delay_rect.rect_size.x -= 0.4
	
	if delay_rect.rect_size.x <= 0:
		if mental_rect.rect_size.x >= 0:
			mental_rect.rect_size.x -= 1
	
	if mental_rect.rect_size.x == 0:
		emit_signal("mental_health_ended")


func when_light_ended():
	if delay_rect.rect_size.x >= 0:
		delay_rect.rect_size.x -= 0.4
	
	if delay_rect.rect_size.x <= 0:
		if mental_rect.rect_size.x >= 0:
			mental_rect.rect_size.x -= 1
	
	if mental_rect.rect_size.x == 0:
		emit_signal("mental_health_ended")

