extends Node


@onready var screen_confirm = preload("res://Game/screen_confirm.tscn")
@onready var screen_popup_msg = preload("res://Game/screen_popup_message.tscn")


func show_confirm(parent: Node, callback: Callable):
	var screen = screen_confirm.instantiate()
	parent.add_child(screen)
	screen.show_screen(callback)


func show_popup_msg(message: String, info_lvl: int = 0):
	var screen = screen_popup_msg.instantiate()
	# Add as child of main screen so stays on top
	self.get_parent().get_child(-1).add_child(screen)
	screen.show_screen(message, info_lvl)
