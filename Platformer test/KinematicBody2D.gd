extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const JUMP_FORCE = -900
const GRAVITY = 30

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
		$Sprite.play("Walk")
	elif Input. is_action_pressed("Left"):
		velocity.x = -SPEED
		$Sprite.play("Walk")
	else:
		$Sprite.play("Idle")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_FORCE
		
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
