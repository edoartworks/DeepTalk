extends Control


func _on_btn_add_q_pressed() -> void:
	SignalBus.show_add_question_screen.emit()


func _on_btn_delete_q_pressed() -> void:
	Popups.show_confirm(self, _on_btn_delete_q_pressed_confirmed)


func _on_btn_delete_q_pressed_confirmed() -> void:
	Deck.delete_current_question()
	Popups.show_popup_msg("Question deleted", 1)


func _on_btn_shuffle_deck_pressed() -> void:
	SignalBus.shuffle_deck.emit()
	Popups.show_popup_msg("Deck shuffled")


func _on_btn_font_less_pressed() -> void:
	SignalBus.font_size_less.emit()


func _on_btn_font_more_pressed() -> void:
	SignalBus.font_size_more.emit()


func _on_btn_goto_first_pressed() -> void:
	SignalBus.cardmenu_goto_first.emit()
	Popups.show_popup_msg("First question reached")
