extends Node2D

signal game_started
signal show_credits
signal choice_selected

export var talk_id = "0"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Menu/VBox/HBoxContainer/Buttons/StartButton.call_deferred("grab_focus")

func _on_CreditsButton_pressed():
	emit_signal("show_credits")
	emit_signal("choice_selected", "credits")

func _on_StartButton_pressed():
	emit_signal("game_started")
	emit_signal("choice_selected", "start")
