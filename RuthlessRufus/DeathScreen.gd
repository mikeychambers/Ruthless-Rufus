extends Control

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://deathSFX.wav")
	player.volume_db = -10
	player.play()

func _on_Button_pressed():
	get_tree().change_scene("res://WorldAutop.tscn")


func _on_Button2_pressed():
	get_tree().quit()
