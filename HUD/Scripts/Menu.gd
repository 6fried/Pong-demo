extends CanvasLayer

signal start_game
signal resume

func _ready():
	$Mode.hide()
	

func _on_SartGame_pressed():
	emit_signal("start_game")
	$MainMenu.hide()
	$Mode.hide()

func _on_Exit_pressed():
	Global.save_game()
	get_tree().quit()

func _on_GameMode_pressed():
	$MainMenu.hide()
	$Mode.show()


func _on_Mouse_pressed():
	Global.set_game_mode(Global.game_play.MOUSE)
	$Mode.hide()
	$MainMenu.show()

func _on_Keyboard_pressed():
	Global.set_game_mode(Global.game_play.KEYBOARD)
	$Mode.hide()
	$MainMenu.show()


func _on_Return_pressed():
	$Mode.hide()
	$MainMenu.show()


func _on_ResumeGame_pressed():
	emit_signal("resume")
