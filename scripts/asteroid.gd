extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.z_index=-5
	var comet_types =Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation=comet_types[3]
	$AnimatedSprite2D.play()
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func reshape(scale):
	$VisibleOnScreenNotifier2D.scale*=scale
	$AnimatedSprite2D.scale*=scale
	$CollisionShape2D.scale*=scale
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.

func collision_with_spacceship(ship) -> void:
	print("death")
	ship.crashed()
	#hide()
	#queue_free()


func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.
