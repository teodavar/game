extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var comet_types =Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation=comet_types[0]
	$AnimatedSprite2D.play()
	 # Replace with function body.

func _on_parent_reset() -> void:
	queue_free() # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.

func collision_with_spacceship() -> void:
	#print("121212")
	hide()
	queue_free()
