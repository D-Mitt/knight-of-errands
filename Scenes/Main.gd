extends Node2D

onready var _transition_rect := get_node("SceneWrapper/CanvasLayer/Control/SceneTransitionRect")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_StartScreen_game_started():
	_transition_rect.transition_to(get_node("StartScreen"), get_node("Introduction"))
	
func _on_Introduction_intro_completed():
	_transition_rect.transition_to(get_node("Introduction"), get_node("Dungeon"))

func _on_Dungeon_completed_level():
	_transition_rect.transition_to(get_node("Dungeon"), get_node("EndingScreen"))

func _on_EndingScreen_ending_completed():
	_transition_rect.transition_to(get_node("EndingScreen"), get_node("StartScreen"))
