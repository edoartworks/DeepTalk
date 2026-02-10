extends CanvasLayer

signal close_screen
@onready var FILE_DIALOG = $FileDialog


func _on_btn_cancel_pressed() -> void:
	close_screen.emit()


func _on_btn_import_pressed() -> void:
	FILE_DIALOG.visible = true


func _on_file_dialog_file_selected(path: String) -> void:
	if Deck.import_questions(path):
		Popups.show_popup_msg("Questions imported", 1)
		close_screen.emit()
	else:
		Popups.show_popup_msg("Questions failed to import", 2)
