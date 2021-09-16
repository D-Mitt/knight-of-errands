extends Node2D

signal completed_level
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$CanvasLayer/Control.hide()
	set_process(false)
	$CanvasLayer/Control.get_node("Player").set_process(false)
	$CanvasLayer/Control.get_node("Player").set_process_input(false)

func _on_Player_completed_level():
	emit_signal("completed_level")
	
func reset():
	$CanvasLayer/Control/Player.set_position(Vector2(168, 232))
	$CanvasLayer/Control/Player.show()
	$CanvasLayer/Control/Player.set_has_crown(false)
	$CanvasLayer/Control/Player/Sprite.flip_h = false
	$CanvasLayer/Control/Crown.show()
