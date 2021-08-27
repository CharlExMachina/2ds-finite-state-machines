extends KinematicBody2D

export(float) var speed: = 100.0
export(float) var gravity: = 98.0
export(float) var jump_impulse: = 120.0

onready var sprite: AnimatedSprite = $Sprite

var velocity: = Vector2(0, 0)

func _ready() -> void:
	pass
