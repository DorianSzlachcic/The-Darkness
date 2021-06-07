extends Area2D

var turn_on = false

onready var sprite = $Sprite
onready var audio = $AudioStreamPlayer

func _on_Leaver_body_entered(_body):
	turn_on = true
	audio.play(0)
	sprite.frame = 1

func _on_Leaver_body_exited(_body):
	turn_on = false
	sprite.frame = 0
	set_deferred("monitoring", false)
