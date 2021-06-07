extends CanvasLayer

onready var animation = $AnimationPlayer
onready var audio = $AudioStreamPlayer

func _ready():
	animation.play("game_over")
