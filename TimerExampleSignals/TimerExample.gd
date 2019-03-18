extends Node

func _on_Timer_timeout():
	$Sprite.visible = !$Sprite.visible
