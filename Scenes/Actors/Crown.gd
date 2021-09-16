extends Area2D

func _ready():
	connect("body_entered", self, "_on_Crown_body_entered")

func _on_Crown_body_entered(body):
	if (body.is_in_group("Player")):
		body.set_has_crown(true)
		queue_free()
