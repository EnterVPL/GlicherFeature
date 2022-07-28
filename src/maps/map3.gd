extends Node2D

var delta_max := 5.0
var delta_sum := 0.0

func _process(delta):
	delta_sum += delta
	if(delta_sum >= delta_max && !$AudioStreamPlayer.is_playing()):
		$AudioStreamPlayer.play()
		delta_sum = 0
