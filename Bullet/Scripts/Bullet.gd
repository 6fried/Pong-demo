extends KinematicBody2D

var speed = 200
var velocity = Vector2(500, 100)
var vymin = -320
var vymax = 320

func _ready():
	position = Vector2(320, 100)


func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		$Pong.play()
		velocity = velocity.bounce(collision.normal)

func set_veloc(x,  y):
	velocity = Vector2(x, y)

func set_v(new_v:Vector2):
	velocity = new_v

func get_veloc():
	return velocity
