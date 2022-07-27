extends Node2D

export var gravitation := 5000.0
export var speed := 5000.0

onready var animationPlayer := $KinematicBody2D/AnimationPlayer

enum animationPlayerEnum { RIGHT, LEFT, STOP }

var vel := Vector2.ZERO
var currentStatusPlayer = animationPlayerEnum.STOP

func _physics_process(delta):
	var animationStatus = animationPlayerEnum.STOP
	vel.y = gravitation

	vel.x = 0.0 + speed
	animationStatus = animationPlayerEnum.RIGHT
		
	vel *= delta
		
	$KinematicBody2D.move_and_slide(vel)
