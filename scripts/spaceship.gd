extends Area2D
signal hit
@export var speed=400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	screen_size= get_viewport_rect().size # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity =Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y+=1
	if Input.is_action_pressed("move_up"):
		velocity.y-=1
	if Input.is_action_pressed("move_left"):
		velocity.x-=1
	if Input.is_action_pressed("move_right"):
		velocity.x+=1
	if velocity.length() > 0:
		velocity=velocity.normalized() *speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position+=velocity*delta
	position=position.clamp(Vector2.ZERO,screen_size)


func _on_body_entered(body: Node2D) -> void:
	# body: the object that hits the spaceship
	
	print(body.get_name()) # prints the name of the class!
	body.collision_with_spacceship()
	#print(position)
	#position=position.clamp(position-Vector2(0,150),screen_size)
	position=position+Vector2(0,50) # recoil after hit
	position=position.clamp(Vector2.ZERO,screen_size)
	#print(position)
	#hide()
	hit.emit()
	#$CollisionShape2D.set_deferred("disabled",true)
	
func	 start(pos):
	position =pos
	show()
	$CollisionShape2D.disabled=false 
	
func haha():
	show()
	$CollisionShape2D.disabled=false 
