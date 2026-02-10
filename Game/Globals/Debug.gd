extends Node

var DEBUG_LOG = ""
var DEBUG_WIN_SIZE = Vector2i(700, 1400)

func log(text):
	DEBUG_LOG += str(text) + "\n"
	print(text)

func set_win_half_res() -> void:
	var current_size = DisplayServer.window_get_size()
	DisplayServer.window_set_size(DEBUG_WIN_SIZE)
	# Center window
	var screen_size = DisplayServer.screen_get_size()
	var new_position = (screen_size - DEBUG_WIN_SIZE) / 2
	DisplayServer.window_set_position(new_position)
