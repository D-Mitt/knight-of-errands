extends Node2D

signal credits_completed

export var talk_id = "0"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	hide()
	$CanvasLayer/Control.hide()
	
func _on_dialog_ended(_text_id):
	UI.disconnect("dialog_ended", self, "_on_dialog_ended")
	emit_signal("credits_completed")

func _on_StartScreen_show_credits():
	UI.connect("dialog_ended", self, "_on_dialog_ended")
	UI.start_dialog(talk_id)
