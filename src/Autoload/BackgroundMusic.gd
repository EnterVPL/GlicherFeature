extends AudioStreamPlayer

var musicName := "res://assets/music/projekcik "
var musics := [
	"12.mp3", "16.mp3",
	"17 i 3.mp3",
	"23.mp3", "24.mp3",
	"26.mp3", "31.mp3",
	"32.mp3", "33.mp3",
	"37.mp3", "39.mp3",
	"40 i 2.mp3",
	"46.mp3", "37.mp3"
]

var deltaWaitSum := 1.0
var deltaSum := 0.0

func _process(delta):
	if(deltaSum >= deltaWaitSum && !self.is_playing()):
		self.play()
	elif(!self.is_playing()):
		deltaSum += delta
	if(Input.is_action_just_pressed("jump")) :
		var random_index : int = randi() % musics.size()
		var random_music = musics[random_index]
		random_music = musicName + random_music
		self.stream = load(random_music)
		self.play()
		
