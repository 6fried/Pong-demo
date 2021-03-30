extends Node

export (PackedScene) var bullet = ResourceLoader.load("res://Bullet/Scenes/Bullet.tscn")
enum game_play{MOUSE, KEYBOARD}
var Score = 00
var BestScore = 00
var game_mode

func _ready():
	if OS.get_name() in ["Android", "iOS"] :
		OS.window_size = OS.get_screen_size()
		game_mode = game_play.MOUSE
	else:
		game_mode = game_play.KEYBOARD
	load_game()

func get_game_mode():
	return game_mode

func set_game_mode(type):
	game_mode = type

func save_game():
	var saved_game = File.new()
	saved_game.open_encrypted_with_pass(OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)+"/save.sav", File.WRITE, OS.get_unique_id())
	saved_game.store_line(to_json({"BestScore": BestScore}))
	saved_game.close()

func load_game():
	var saved_game = File.new()
	if not saved_game.file_exists(OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)+"/save.sav"):
		return
	saved_game.open_encrypted_with_pass(OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)+"/save.sav", File.READ, OS.get_unique_id())
	var node_data = parse_json(saved_game.get_line())
	set("BestScore", node_data["BestScore"])
