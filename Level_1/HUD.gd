extends CanvasLayer

var coins = 0

func _ready():
	$Coins.text = String(coins)
	
	if coins == 10:
		get_tree().change_scene("res://Level_1/Level_1.tscn")


func _on_Coin_collected():
	coins = coins + 1
	_ready()
