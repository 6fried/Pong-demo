extends Node

signal game_over
var lost_count = 00
var paused
var level_data

func _ready():
	pass
func _on_Goal_body_entered(body):
	if body is KinematicBody2D:
		body.queue_free()
		Global.Score += 10
		var ball = Global.bullet.instance()
		ball.set_veloc(500, rand_range(ball.vymin, ball.vymax))
		call_deferred("add_child", ball)

func _on_Left_body_entered(body):
	if body is KinematicBody2D:
		if lost_count < 3:
			lost_count += 1
			var ball = Global.bullet.instance()
			ball.set_veloc(500, rand_range(ball.vymin, ball.vymax))
			call_deferred("add_child", ball)
		else:
			body.queue_free()
			emit_signal("game_over")
