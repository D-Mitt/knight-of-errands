extends ColorRect

# Path to the next scene to transition to
export(String, FILE, "*.tscn") var next_scene_path

# Reference to the _AnimationPlayer_ node
onready var _anim_player := $AnimationPlayer

func _ready() -> void:
	# Plays the animation backward to fade in
	_anim_player.play_backwards("Fade")


func transition_to(to_hide, to_show) -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	
	#hide and show scenes before removing fade
	hide_scene(to_hide)
	show_scene(to_show)
	
	_anim_player.play_backwards("Fade")
	yield(_anim_player, "animation_finished")
	
func hide_scene(to_hide):
	to_hide.set_process(false)
	to_hide.set_physics_process(false)
	to_hide.hide()
	#stop player movement and processing
	if to_hide.is_in_group("dungeon"):
		to_hide.get_node("Player").set_process(false)
		to_hide.get_node("Player").set_physics_process(false)
	
func show_scene(to_show):
	to_show.set_process(true)
	to_show.set_physics_process(true)
	to_show.show()
	
	#If showing dungeon, stop player movement while transitioning
	if to_show.is_in_group("dungeon"):
		to_show.get_node("Player").set_process(true)
		to_show.get_node("Player").set_physics_process(true)
