extends Area2D

signal lives_changed(current_lives: int)
signal crash
signal hit
signal landing(current_lives: int, planet_id: String)
@export var speed=400
@export var boostspeed=2
@export var max_lives: int = 3
var boost_state=0 #0 = ready, 1=active, 2=cooldown
var lives: int = 0
var invulnerable := false
var screen_size
#https://www.seekpng.com/ima/u2q8a9i1r5r5e6a9/
var boostvel=Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation="fly"
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
	velocity+=boost(velocity)
	position+=velocity*delta
	position=position.clamp(Vector2.ZERO,screen_size)

func boost(velocity):
	if boost_state==0:
		if Input.is_action_pressed("boost") and velocity!=Vector2.ZERO:
			$boostactive.start()
			boostvel=velocity*boostspeed
			boost_state=1
			return boostvel
	if boost_state==1:
		return boostvel
	if boost_state==2:
		boostvel=Vector2.ZERO
		return boostvel
	return boostvel
	
func _on_body_entered(body: Node2D) -> void:
	# body: the object that hits the spaceship
	#print(body.get_name()) # prints the name of the class!
	body.collision_with_spacceship(self)
	#print(position)
	#position=position.clamp(position-Vector2(0,150),screen_size)

	#print(position)
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled",true)
	
func recoil():
	$AnimatedSprite2D/shield.animation="on"
	$AnimatedSprite2D.play()
	invulnerable=true
	position=position+Vector2(0,5) # recoil after hit
	position=position.clamp(Vector2.ZERO,screen_size)
	await get_tree().create_timer(0.3).timeout
	invulnerable=false
	$AnimatedSprite2D/shield.animation="off"
	$AnimatedSprite2D.play()
	
	
func	 start(pos):
	position =pos
	show()
	$CollisionShape2D.disabled=false 
	
func got_hit():
	
	if invulnerable:
		print("shield block")
		return
	
	lives -= 1
	emit_signal("lives_changed", lives)
	print("lives Left: ", lives)
		
	if lives <= 0:
		crashed()
	else:
		#recoil()
		hit.emit()
	recoil()
	
func crashed():
	
	if invulnerable:
		print("shield block")
		return
	lives = 0
	emit_signal("lives_changed", lives)
	crash.emit()
	
func landed(planet_id):
	landing.emit(lives,planet_id)
	print("landing on ",planet_id,"with ",lives,"lives")

	
func haha():
	show()
	$CollisionShape2D.disabled=false 
	


func _on_boostactive_timeout() -> void:
	boostvel=Vector2.ZERO
	boost_state=2 
	$boostcooldown.start()# Replace with function body.


func _on_boostcooldown_timeout() -> void:
	boost_state=0  # Replace with function body.
