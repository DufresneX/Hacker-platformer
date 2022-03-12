extends KinematicBody2D

var coins = 0
var velocity = Vector2(0,0)
const SPEED = 180
const JUMP_FORCE = -900
const GRAVITY = 30

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("Left"):
		velocity.x = -SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("Idle")
		
	if not is_on_floor():
		$Sprite.play("Air")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_FORCE
		
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)



func _on_Fall_zone_body_entered(body):
	get_tree().change_scene("res://Level_1/Level_1.tscn")



func bounce():
	velocity.y = JUMP_FORCE * 0.75
	

func ouch(var EnemyPosX):
	set_modulate(Color(1,0.3,0.3,0.45))
	velocity.y = JUMP_FORCE * 0.5
	
	if position.x < EnemyPosX:
		velocity.x = -800
	elif position.x > EnemyPosX:
		velocity.x = 800
	
	Input.action_release("Left")
	Input.action_release("Right")
	
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Level_1/Level_1.tscn")

func spring():
	velocity.y = JUMP_FORCE * 1.25
	
