extends CanvasLayer

var info_colors: Dictionary = {
	0: Color("caded2"),
	1: Color("33db79"),
	2: Color("ef714d")
}
var popup_duration = 2.5 # Min 1s because of open animation

@onready var panel_bg: StyleBoxFlat = $PanelContainer.get_theme_stylebox("panel")
@onready var lbl_message = $PanelContainer/MarginContainer/VBoxContainer/lbl_message
@onready var lbl_message_err = $PanelContainer/MarginContainer/VBoxContainer/lbl_message_err
@onready var timer = $Timer
@onready var anim_player = $AnimationPlayer


func show_screen(message, info_lvl):
	lbl_message.set_text(message)
	panel_bg.set("bg_color", info_colors[info_lvl])
	self.visible = true
	anim_player.play("Open")
	if info_lvl == 2:
		lbl_message_err.visible = true
		popup_duration += 1
	timer.start(popup_duration)


func _on_timer_timeout() -> void:
	anim_player.play("Close")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Close":
		self.queue_free()
