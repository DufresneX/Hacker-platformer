extends Area2D

signal coin_collected

func _on_Coin2D_body_entered(body):
	$AnimationPlayer.play("Coin collect")
	emit_signal("coin_collected")
	set_collision_mask_bit(0,false)


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
