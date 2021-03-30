extends StaticBody2D

func _ready():
	set_position(200, 32)


func _process(delta):
	if Global.get_game_mode() == Global.game_play.MOUSE:
		set_position(get_global_mouse_position().y)
	elif Global.get_game_mode() == Global.game_play.KEYBOARD:
		position.y += get_input()*delta
		position.y = clamp(position.y, 16, get_viewport_rect().size.y-16)

func get_input():
	var velocity = Vector2()
	var speed = 200
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized()*speed
	return velocity.y

func set_position(posy, posx = 32):
	position.x = posx
	if posy < 32:
		position.y = 32
	elif posy > get_viewport_rect().size.y-32:
		position.y = get_viewport_rect().size.y-32
	else:
		position.y = posy
