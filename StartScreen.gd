extends Node2D

signal game_started

export var talk_id = "0"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("confirm"):
		emit_signal("game_started")

