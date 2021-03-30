extends Node

func _ready():
	randomize()
	$HUD/Score.hide()
	$Game/Board/Borders/Separator.hide()

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		Global.save_game()
		get_tree().quit()

func _on_HUD_start_game():
	$Game.set("lost_count", 0)
	Global.set("Score", 0)
	var ball = Global.bullet.instance()
	ball.set_veloc(500, rand_range(ball.vymin, ball.vymax))
	$HUD/Best.hide()
	$Game/Board/Borders/Separator.show()
	$Message.show()
	$Message.text = "3"
	yield(get_tree().create_timer(1), "timeout")
	$Message.text = "2"
	yield(get_tree().create_timer(1), "timeout")
	$Message.text = "1"
	yield(get_tree().create_timer(1), "timeout")
	$Message.text = "Let's Play"
	yield(get_tree().create_timer(1), "timeout")
	$Message.hide()
	$Game/Player.show()
	$HUD/Score.show()
	yield(get_tree().create_timer(0.5), "timeout")
	$Game.add_child(ball)

func game_over():
	get_tree().call_group("ball", "queue_free")	
	$Message.text = "Game\nOver"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")
	$Message.hide()
	if Global.Score > Global.BestScore:
		Global.BestScore = Global.Score
		#TODO: animation new record
	$HUD/Score.hide()
	$Game/Player.hide()
	$HUD/Best.show()
	$HUD/Menu/MainMenu.show()
