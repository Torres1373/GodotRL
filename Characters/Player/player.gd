extends Character

func _process(_delta: float) -> void:
	var mous_dir = Vector2(get_global_mouse_position() - global_position).normalized()
	velocity.y += GRAVITY
	
	if mous_dir.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mous_dir.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	
func get_input() -> void:
	mov_dir = Vector2.ZERO
	mov_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	mov_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
