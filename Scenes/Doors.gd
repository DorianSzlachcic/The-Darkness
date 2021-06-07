extends Area2D

onready var audio = $AudioStreamPlayer2D

enum{
	MOVE,
	CLIMB,
	END_LVL
}

func _on_Doors_body_entered(body):
	body.state = END_LVL
	audio.play(0)


func _on_AudioStreamPlayer2D_finished():
	get_parent().change_level()
