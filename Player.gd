extends KinematicBody2D

signal completed_level
onready var has_crown = false
onready var is_facing_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)

func _physics_process(_delta):
	var collidedObject
	if Input.is_action_just_pressed("ui_left"):
		collidedObject = move_and_collide(Vector2(-52, 0))
		if is_facing_right:
			$Sprite.flip_h = true
			is_facing_right = false
	elif Input.is_action_just_pressed("ui_right"):
		collidedObject = move_and_collide(Vector2(52, 0))
		if !is_facing_right:
			$Sprite.flip_h = false
			is_facing_right = true
	elif Input.is_action_just_pressed("ui_up"):
		collidedObject = move_and_collide(Vector2(0, -52))
	elif Input.is_action_just_pressed("ui_down"):
		collidedObject = move_and_collide(Vector2(0, 52))
		
	if collidedObject != null:
		var collider = collidedObject.get_collider()
		
		if collider != null && collider.is_in_group("Stairs"):
			if get_has_crown():
				$Sprite.visible = false
				print("woohhoo")
				emit_signal("completed_level")
			else:
				collider.display_text()
	
func set_has_crown(holding_crown):
	$".".has_crown = holding_crown
	
func get_has_crown():
	return has_crown
