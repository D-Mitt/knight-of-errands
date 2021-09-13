extends Node2D

signal completed_level
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	set_process(false)
	get_node("Player").set_process(false)
	get_node("Player").set_process_input(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_completed_level():
	emit_signal("completed_level")
