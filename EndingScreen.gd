extends Node2D

signal ending_completed

export var talk_id = "0"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	hide()
	$CanvasLayer/Control.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_Dungeon_completed_level():
	UI.connect("dialog_ended", self, "_on_dialog_ended")
	UI.start_dialog(talk_id)
	
func _on_dialog_ended(_text_id):
	UI.disconnect("dialog_ended", self, "_on_dialog_ended")
	emit_signal("ending_completed")
