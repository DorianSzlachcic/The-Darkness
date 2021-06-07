extends StaticBody2D

func _process(_delta):
	var lever = get_parent().lever1_on
	if lever == true:
		queue_free()
