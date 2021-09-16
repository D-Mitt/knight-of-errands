extends Button

export(String) var scene_to_load
export(String) var button_text

onready var button_sound = self.owner.get_node("ButtonSound")


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("focus_entered", self, "_on_Button_focus_entered")
	connect("focus_exited", self, "_on_Button_focus_exited")
	connect("focus_entered", button_sound, "_on_choice_hovered")
	set_text(button_text)
	$AnimatedSprite.hide()

func _on_Button_focus_entered():
	$AnimatedSprite.show()


func _on_Button_focus_exited():
	$AnimatedSprite.hide()
