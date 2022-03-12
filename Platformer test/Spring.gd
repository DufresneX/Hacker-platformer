extends StaticBody2D



func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("Spring")
	$Timer.start()
	body.spring()
	

func _on_Timer_timeout():
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 0
