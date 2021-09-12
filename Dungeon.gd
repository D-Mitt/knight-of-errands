extends Node2D

signal completed_level
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	set_process(false)
	get_node("Player").set_process(false)
	get_node("Player").set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_completed_level():
	print("123354234873653487")
	emit_signal("completed_level")
