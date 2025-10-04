extends space_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(start_time=0):
	set_flip()
	level_duration=15
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(4)
	huge_asteroid.rotation+=PI
	huge_asteroid.change_collision()
	generate_field(huge_asteroid,Vector2(2100,313),-PI,80,0,0,start_time+0,1,Vector2(0,5),Vector2(0.9,1.8))
	generate_field(comet_scene,Vector2(-100,313),0,200,0.2,4,start_time+7,5,Vector2(0,100))
	generate_field(comet_scene,Vector2(-100,313),0,450,0.2,5,start_time+8,7,Vector2(0,100))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,200,0.3,3,start_time+9,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,400,0.3,3,start_time+11,3,Vector2(0,50))
	var c=randi_range(0,4)
	if c==0:
		generate_field(asteroid_scene,Vector2(200,-200),PI/2,180,0,0,start_time+10.5,1,Vector2(0,5),Vector2(0.9,1.4))
	elif c==1:
		generate_field(asteroid_scene,Vector2(200,720+200),-PI/2,180,0,0,start_time+10.5,1,Vector2(0,5),Vector2(0.9,1.4))
	elif c==2:
		generate_field(comet_scene,Vector2(175,-100),PI/2,100,0.3,1,start_time+11,3,Vector2(175,0))
	return level_duration
