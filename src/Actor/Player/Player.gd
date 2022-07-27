extends Node2D

export var gravitation := 5000.0
export var speed := 5000.0
export var jump_foce := 150000.0

onready var animationPlayer := $KinematicBody2D/AnimationPlayer

enum animationPlayerEnum { RIGHT, LEFT, STOP }

var vel := Vector2.ZERO
var currentStatusPlayer = animationPlayerEnum.STOP

func _setAnimation(status) :
	if(status == currentStatusPlayer):
		return
	match(status) :
		animationPlayerEnum.STOP : 
			animationPlayer.stop()
		animationPlayerEnum.RIGHT : 
			animationPlayer.play("WalkingRight")
		animationPlayerEnum.LEFT : 
			animationPlayer.play("WalkingLeft")
	currentStatusPlayer = status

func _physics_process(delta):
	var animationStatus = animationPlayerEnum.STOP
	vel.y = gravitation
	
	if Input.is_action_pressed("walk_left") :
		vel.x = 0.0 - speed
		animationStatus = animationPlayerEnum.LEFT
	elif Input.is_action_pressed("walk_right") :
		vel.x = 0.0 + speed
		animationStatus = animationPlayerEnum.RIGHT
	if Input.is_action_just_pressed("jump") :
		vel.y = 0.0 - jump_foce
		
	vel *= delta
	
	_setAnimation(animationStatus)
	
	$KinematicBody2D.move_and_slide(vel)



func _on_HitBox_body_entered(body):
	if("BadBall" in body.name):
		$KinematicBody2D.rotation += 0.03
		get_tree().get_root().get_node("Map").rotation += 0.05
		_add_yolo()
	elif("Coin" in body.name):
		$KinematicBody2D.rotation = 0.0
		get_tree().get_root().get_node("Map").rotation = 0.0
		body.coin_collected()
	elif("Spikes" in body.name):
		$KinematicBody2D.rotation += 0.6
		get_tree().get_root().get_node("Map").rotation += 0.05
		_add_yolo()

func _add_yolo():
	GlobalSignals.emit_signal("add_yolo")
	
