extends space_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(start_time=0):
	set_flip()
	level_duration=20
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(1.8)
	huge_asteroid.rotation+=0
	huge_asteroid.change_collision()
	generate_field(huge_asteroid,Vector2(100,720+200),-PI/4-PI/100,77,0,0,start_time+0,1,Vector2(5,0),Vector2(1,1.2))
	generate_field(comet_scene,Vector2(-100,720),-PI/10,400,0.2,3,start_time+2,7,Vector2(0,100))
	generate_field(comet_scene,Vector2(500,-100),PI/3,100,0.2,0.6,start_time+4,3,Vector2(150,0))
	generate_field(comet_scene,Vector2(500,-100),PI/3,400,0.1,4.5,start_time+5.5,7,Vector2(150,0))
	generate_field(asteroid_scene,Vector2(1280+300,400),1.005*PI,100,2,4,start_time+6,1,Vector2(0,300))
	generate_field(comet_scene,Vector2(1280+100,400),1.1*PI,400,0.3,4,start_time+10,7,Vector2(0,200))
	
	var c=randi_range(0,2)
	
	if c==0:
		generate_field(comet_scene,Vector2(-100,0),PI/10,100,0.5,4,start_time+0,1,Vector2(0,300))
	elif c==1:
		generate_field(comet_scene,Vector2(-100,250),-PI/25,150,0.1,0.5,start_time+3,1,Vector2(0,25))
		generate_field(comet_scene,Vector2(-100,250),-PI/25,400,0.1,3.5,start_time+4,5,Vector2(0,25))
	
		#generate_field(asteroid_scene,Vector2(200,720+200),-PI/2,180,0,0,start_time+10.5,1,Vector2(0,5),Vector2(0.9,1.4))
	elif c==2:
		pass#generate_field(comet_scene,Vector2(175,-100),PI/2,100,0.3,1,start_time+11,3,Vector2(175,0))
	
	
	return level_duration
