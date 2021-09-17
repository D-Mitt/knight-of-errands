extends CanvasLayer

signal dialog_ended(text_id)

onready var dialog_black = $DialogBlack
onready var dialog_credits = $Credits

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_dialog(index, dialog_style = "black"):
	# Choose different dialog box styles
	if dialog_style == "black":
		dialog_black.start_dialog(index)
	elif dialog_style == "credits":
		dialog_credits.start_dialog(index)
	# TODO: change text_box layout (center-top vs center-bottom) based on speaker position.
	
	# NOTE: make sure the position of dialog does NOT change during game, 
	# otherwise it can mess up position of Next icon. -- be sure to set layout!

func _on_dialog_ended(text_id):
	emit_signal("dialog_ended", text_id)
