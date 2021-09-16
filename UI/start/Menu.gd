extends HBoxContainer

signal choice_selected(next_id)

onready var button_container = $Buttons
onready var button_sound = self.owner.get_node("ButtonSound")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_buttons():
	# if button container has more than 2 buttons, we have bigger problems
	if button_container.get_child_count() == 2:
		for num in range(2):
			button_container.get_child(0).connect("pressed", self, "_on_start_button_pressed")
			button_container.get_child(1).connect("focus_entered", button_sound, "_on_choice_hovered")

func _on_start_button_pressed():
	print("start button")
#	emit_signal("choice_selected", next_id)
