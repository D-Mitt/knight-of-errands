"""
DialogChoices recieves an array of choices and creates buttons for each choices
with cooresponding next dialog id accordingly. Visibility is controlled by parent dialog UI.

Dependencies:
	Globals.END_DIALOG_ID
"""

extends HBoxContainer

signal choice_selected(next_id)

onready var button_container = $VBox
onready var button_sound = self.owner.get_node("ButtonSound")

# TODO: If choices text short, then add columns instead of rows, looks nicer for Yes/No.
# (1) Add HBox + Button if choices total text length is short enough (horizontal style)
# (2) Add VBox + Button if choices text length is long (column style)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Creates and connects each button in the button container, representing choices.
# 	choices - an array of format: 
#	[{	"text" : "choice_text", 
#		"next" : "next_dialog_id", 
#		"action" : "what to do on choice selected"
#		"show_only_if" : "show this choice only if this condition is met"}]
func set_buttons():
	# Delete old choices from previous dialogs.
	for button in button_container.get_children():
		button.queue_free()
	# Populate with current choices.
	for num in range(2):
		var button = Button.new()
		button.text = "start"
		button_container.add_child(button)
		button.connect("pressed", self, "_on_start_button_pressed")
		button.connect("focus_entered", button_sound, "_on_choice_hovered")

func _on_start_button_pressed():
	print("start button")
#	emit_signal("choice_selected", next_id)
#	# Execute actions associated with choosing button choice.
#	if action:
#		for act in action:
#			Globals.execute(act)
