extends Node2D

onready var _transition_rect := get_node("SceneWrapper/CanvasLayer/Control/SceneTransitionRect")

func _on_StartScreen_game_started():
	_transition_rect.transition_to(get_node("StartScreen"), get_node("Introduction"))
	UI.get_node("DialogBlack")._on_set_text_speed(0.06)
	
func _on_Introduction_intro_completed():
	_transition_rect.transition_to(get_node("Introduction"), get_node("Dungeon"))

func _on_Dungeon_completed_level():
	_transition_rect.transition_to(get_node("Dungeon"), get_node("EndingScreen"))

func _on_EndingScreen_ending_completed():
	_transition_rect.transition_to(get_node("EndingScreen"), get_node("StartScreen"))
	$StartScreen/CanvasLayer/Menu/VBox/HBoxContainer/Buttons/StartButton.call_deferred("grab_focus")
	
func _on_Credits_started():
	_transition_rect.transition_to(get_node("StartScreen"), get_node("Credits"))
	UI.get_node("Credits")._on_set_text_speed(0.01)

func _on_Credits_completed():
	_transition_rect.transition_to(get_node("Credits"), get_node("StartScreen"))
	yield(get_tree().create_timer(0.5), "timeout")
	$StartScreen/CanvasLayer/Menu/VBox/HBoxContainer/Buttons/StartButton.grab_focus()
	
