extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var comet_types =Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation=comet_types[0]
	$AnimatedSprite2D.play()
	 # Replace with function body.
func reshape(scale):
	$AnimatedSprite2D.scale*=scale
	$CollisionShape2D.scale*=scale
func _on_parent_reset() -> void:
	queue_free() # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.

func collision_with_spacceship(ship) -> void:
	
	print("hit")
	ship.got_hit()
	hide()
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body is RigidBody2D:
		print("asteroid blocked comet")
		#var collision_normal = (global_position - body.global_position).normalized()
		#body.apply_central_impulse(collision_normal * 500) # Adjust force as needed
		queue_free() # Replace with function body.
