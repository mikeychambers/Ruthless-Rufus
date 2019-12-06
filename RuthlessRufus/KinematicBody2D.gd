extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELRATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()



func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELRATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELRATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
			var player = AudioStreamPlayer.new()
			self.add_child(player)
			player.stream = load("res://JumpSFX.wav")
			player.volume_db = -45
			player.play()
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
	if motion.y > 1000:
		get_tree().change_scene("res://DeathScreen.tscn")
		

	motion = move_and_slide(motion, UP)
	pass