extends Control

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://WinnerSFX.wav")
	player.volume_db = -10
	player.play()



func _on_WinRetry_pressed():
	get_tree().change_scene("res://WorldAutop.tscn")


func _on_WinQuit_pressed():
	get_tree().quit()
