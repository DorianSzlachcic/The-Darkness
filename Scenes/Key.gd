extends Area2D

onready var audio = $AudioStreamPlayer2D

func _on_Key_body_entered(_body):
	get_parent().has_key = true
	set_deferred("monitoring",false)
	visible = false
	audio.play(0)



func _on_AudioStreamPlayer2D_finished():
	queue_free()
