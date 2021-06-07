extends Area2D

onready var audio = $AudioStreamPlayer2D

func _on_Battery_body_entered(_body):
	get_tree().current_scene.get_node("HUD/ColorRect2").rect_size.x = 100
	set_deferred("monitoring",false)
	visible = false
	audio.play(0)



func _on_AudioStreamPlayer2D_finished():
	queue_free()
