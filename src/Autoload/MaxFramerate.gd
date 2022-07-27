extends Node

export var startFps := 15
export var minFps := 5
export var maxFps := 20
export var maxDeltaTime := 2.5
export var minDeltaTime := 0.0

var rng := RandomNumberGenerator.new()
var deltaTime := minDeltaTime

func _ready():
	Engine.set_target_fps(startFps)

func _physics_process(delta):
	deltaTime += delta
	if deltaTime >= maxDeltaTime:
		_randomize_fps()
		deltaTime = minDeltaTime

func _randomize_fps():
	var my_random_fps := rng.randf_range(minFps, maxFps)
	Engine.set_target_fps(my_random_fps)
