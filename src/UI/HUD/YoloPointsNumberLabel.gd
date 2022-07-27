extends Control

var current_yolo := 0


func _ready():
	GlobalSignals.connect("add_yolo", self, "_add_yolo")

func _add_yolo():
	current_yolo += 1
	$YoloPointsNumberLabel.text = "%s" % current_yolo
