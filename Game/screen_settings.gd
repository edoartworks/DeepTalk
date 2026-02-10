extends CanvasLayer

@export var debug_log_lbl_path :NodePath
@onready var SCREEN_ADD_Q_FILE = $ScreenAddQFile
var DEBUG_LOG :Node = null
var DEBUG_SCROLL :Node = null


func _ready() -> void:
	DEBUG_LOG = get_node(debug_log_lbl_path)
	DEBUG_SCROLL = DEBUG_LOG.get_parent()
	if Main.DEBUG_MODE:
		DEBUG_SCROLL.visible = true


func _process(_delta: float) -> void:
	# Update debug log and force scroll to bottom
	if DEBUG_LOG.text == Debug.DEBUG_LOG:
		return
	DEBUG_LOG.text = Debug.DEBUG_LOG
	call_deferred("_debug_scroll_to_bottom")


func _on_btn_exit_pressed() -> void:
	SignalBus.settings_screen_exit_pressed.emit()


func _on_btn_add_q_pressed() -> void:
	SignalBus.show_add_question_screen.emit()


func _on_btn_reset_deck_pressed() -> void:
	Popups.show_confirm(self, _on_btn_reset_deck_confirmed)


func _on_btn_reset_deck_confirmed():
	SignalBus.reset_deck_default.emit()
	Popups.show_popup_msg("Deck reset", 1)


func _on_btn_del_all_q_pressed() -> void:
	Popups.show_confirm(self, _on_btn_del_all_q_confirmed)


func _on_btn_del_all_q_confirmed():
	Deck.delete_all_questions()
	Popups.show_popup_msg("All questions deleted", 1)


func _on_add_q_from_file_pressed() -> void:
	SCREEN_ADD_Q_FILE.visible = true


func _debug_scroll_to_bottom():
	DEBUG_SCROLL.set_deferred("scroll_vertical", DEBUG_SCROLL.get_v_scroll_bar().max_value)


func _on_btn_show_debug_pressed() -> void:
	DEBUG_SCROLL.visible = !DEBUG_SCROLL.visible


func _on_screen_add_q_file_close_screen() -> void:
	SCREEN_ADD_Q_FILE.visible = false
