extends CanvasLayer

signal start_game
signal resume
signal pause

func _ready():
	if Global.BestScore:
		$Best.text = "BestScore: %s" % Global.BestScore
		$Best.show()

func _process(_delta):
	$Score.text = "Score: %s" % str(Global.Score)

func _on_Menu_start_game():
	emit_signal("start_game")
