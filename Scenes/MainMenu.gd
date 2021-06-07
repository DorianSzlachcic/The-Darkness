extends Node2D

onready var animation = $Camera2D/AnimationPlayer

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_Button2_pressed():
	animation.play("credits")

func _on_Button3_pressed():
	animation.play("back")


func _on_Button4_pressed():
	animation.play("tutorial")


func _on_Button5_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")
