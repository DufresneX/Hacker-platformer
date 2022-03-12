extends KinematicBody2D

var speed = 50
export var direction = -1
var velocity = Vector2(0,0)
export var detects_cliffs = true

func bounce():
	velocity.y = 10 * 0.75

func ouch(var EnemyPosX):
	pass

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$RayCast2D.enabled = detects_cliffs
	if not detects_cliffs:
		set_modulate(Color(1.2,0.5,1,1))

func _physics_process(delta):
	
	if is_on_wall() or not $RayCast2D.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	


func _on_Top_checker_body_entered(body):
	$AnimatedSprite.play("Squashed")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_layer_bit(0,false)
	$Top_checker.set_collision_layer_bit(4,false)
	$Top_checker.set_collision_mask_bit(0,false)
	$Sides_checker.set_collision_layer_bit(4,false)
	$Sides_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	body.bounce()
	
	


func _on_Sides_checker_body_entered(body):
	if body.name=="Bob":
		body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()
