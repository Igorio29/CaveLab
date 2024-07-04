extends KinematicBody2D


var motion = Vector2.ZERO

func _process(delta):
	if Input.is_action_pressed("ui_shift"):
		print("Oi")
		if Input.is_action_pressed("ui_right"):
			motion.x = 500
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("Run")
		elif Input.is_action_pressed("ui_left"):
			motion.x = -500
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("Run")
		else:
			motion.x = 0
		if Input.is_action_pressed("ui_up"):
			motion.y = -500
			$AnimatedSprite.play("Run")
		elif Input.is_action_pressed("ui_down"):
			motion.y = 500
			$AnimatedSprite.play("Run")
		else:
			motion.y = 0
		if(motion.x == 0 && motion.y == 0):
			$AnimatedSprite.play("Idlle_player")
		
	else:
		if Input.is_action_pressed("ui_right"):
			motion.x = 250
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("Walking")
		elif Input.is_action_pressed("ui_left"):
			motion.x = -250
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("Walking")
		else:
			motion.x = 0
		
		
		if Input.is_action_pressed("ui_up"):
			motion.y = -250
			$AnimatedSprite.play("Walking")
		elif Input.is_action_pressed("ui_down"):
			motion.y = 250
			$AnimatedSprite.play("Walking")
		else:
			motion.y = 0
		if(motion.x == 0 && motion.y == 0):
			$AnimatedSprite.play("Idlle_player")


	move_and_slide(motion,Vector2.UP)

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_W:
				Input.action_press("ui_up")
			elif event.scancode == KEY_A:
				Input.action_press("ui_left")
			elif event.scancode == KEY_S:
				Input.action_press("ui_down")
			elif event.scancode == KEY_D:
				Input.action_press("ui_right")
			elif event.scancode == KEY_SPACE:
				Input.action_press("ui_up")
		else:
			if event.scancode == KEY_W:
				Input.action_release("ui_up")
			elif event.scancode == KEY_A:
				Input.action_release("ui_left")
			elif event.scancode == KEY_S:
				Input.action_release("ui_down")
			elif event.scancode == KEY_D:
				Input.action_release("ui_right")
			elif event.scancode == KEY_SPACE:
				Input.action_release("ui_up")
