extends KinematicBody2D

signal completed_level
onready var has_crown = false
onready var is_facing_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_process_input(true)

func _input(event):
	if event is InputEventKey:
		var collidedObject
		# an echo is when the event is fired while continuing to hold down the key
		# Only handle collision if it is an actual movement (was getting triggered
		# before moving into ifs
		if event.is_action_pressed("ui_left") && !event.is_echo():
			collidedObject = move_and_collide(Vector2(-52, 0))
			if is_facing_right:
				$Sprite.flip_h = true
				is_facing_right = false
			handle_collision(collidedObject)
		elif event.is_action_released("ui_right") && !event.is_echo():
			collidedObject = move_and_collide(Vector2(52, 0))
			if !is_facing_right:
				$Sprite.flip_h = false
				is_facing_right = true
			handle_collision(collidedObject)
		elif event.is_action_released("ui_up") && !event.is_echo():
			collidedObject = move_and_collide(Vector2(0, -52))
			handle_collision(collidedObject)
		elif event.is_action_released("ui_down") && !event.is_echo():
			collidedObject = move_and_collide(Vector2(0, 52))
			handle_collision(collidedObject)

func handle_collision(collidedObject):
	if collidedObject != null:
		var collider = collidedObject.get_collider()
		
		if collider != null && collider.is_in_group("Stairs"):
			if get_has_crown():
				#$Sprite.visible = false
				set_process_input(false)
				$VictorySound.play()
				yield($VictorySound, "finished")
				emit_signal("completed_level")
				
			else:
				collider.display_text()
				$BlockedStairsSound.play()
				yield($BlockedStairsSound, "finished")
				
		else:
			$WallBonk.play()
	else:
		$MovementSound.play()
	
func set_has_crown(holding_crown):
	$".".has_crown = holding_crown
	if (holding_crown):
		$CrownSound.play()
	
func get_has_crown():
	return has_crown
