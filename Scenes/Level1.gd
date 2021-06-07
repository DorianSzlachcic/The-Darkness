extends Node2D

export var next_level = "res://Scenes/Level2.tscn"
export var current_level = "res://Scenes/Level1.tscn"

onready var door = $Doors
onready var door_sprite = $Doors/Sprite
onready var canvas = $CanvasModulate

var has_key = false setget set_has_key

func set_has_key(value):
	has_key = value
	door_sprite.frame = 1
	door.monitoring = true

func _ready():
	canvas.color = "020202"

func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene(current_level)

func change_level():
	get_tree().change_scene(next_level)
