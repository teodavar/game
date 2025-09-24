extends Area2D
#signal hit
signal lives_changed(current_lives: int)
signal died
@export var speed=400
@export var max_lives: int = 3

var lives: int = 0
var invulnerable := false
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lives = max_lives
	emit_signal("lives_changed", lives)
	
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
	if body.is_in_group("comet"):
		_take_hit()
		
	print(body.get_name()) # prints the name of the class!
	print("hello")
	body.collision_with_spaceship()
	#print(position)
	#position=position.clamp(position-Vector2(0,150),screen_size)
	#position=position+Vector2(0,50) # recoil after hit <---- this one and the one below
	#position=position.clamp(Vector2.ZERO,screen_size)
	#print(position)
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled",true)
	
func start(pos):
	position =pos
	show()
	$CollisionShape2D.disabled=false 
	
func haha():
	show()
	$CollisionShape2D.disabled=false 
	
func _take_hit() -> void:
	if invulnerable:
		return
		
	lives -= 1
	emit_signal("lives_changed", lives)
	print("lives Left: ", lives)
		
	if lives <= 0:
		emit_signal("died")
	

	
