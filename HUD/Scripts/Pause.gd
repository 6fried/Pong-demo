extends TextureButton

func _ready():
	# This ensures that this Node won't be paused, allowing it to
	# process even when the SceneTree is paused. Without that it would
	# not be able to unpause the game. Note that you can set this through
	# the inspector as well.
	pause_mode = Node.PAUSE_MODE_PROCESS


func _toggled(button_pressed):
	var menu = get_parent().get_child(0).get_child(0)
	# Pause or unpause the SceneTree based on whether the button is
	# toggled on or off.
	if button_pressed:
		menu.get_child(0).hide()
		menu.get_child(1).show()
		menu.show()
	else:
		menu.hide()
		menu.get_child(1).hide()
		menu.get_child(0).show()
	get_tree().paused = button_pressed

