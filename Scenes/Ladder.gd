extends Area2D

enum{
	MOVE,
	CLIMB
}

func _on_Ladder_body_entered(body):
	body.state = CLIMB

func _on_Ladder_body_exited(body):
	body.state = MOVE
