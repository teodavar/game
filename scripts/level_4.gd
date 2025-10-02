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
	huge_asteroid.reshape(1.5)
	huge_asteroid.rotation+=0
	generate_field(huge_asteroid,Vector2(1280+200,200),1.05*PI,250,0,0,start_time+4,1,Vector2(0,100))
	generate_field(comet_scene,Vector2(100,-100),PI/2,200,0.1,1,start_time+0,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(100,-100),PI/2,400,0.1,4,start_time+1,3,Vector2(100,0))
	
	generate_field(comet_scene,Vector2(300,-100),PI/2,200,0.1,1,start_time+1,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(300,-100),PI/2,400,0.1,4,start_time+2,3,Vector2(100,0))
	
	generate_field(comet_scene,Vector2(500,-100),PI/2,200,0.1,1,start_time+2,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(500,-100),PI/2,400,0.1,4,start_time+3,3,Vector2(100,0))
	
	generate_field(comet_scene,Vector2(700,-100),PI/2,200,0.1,1,start_time+3,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(700,-100),PI/2,400,0.1,4,start_time+4,3,Vector2(100,0))
	
	generate_field(comet_scene,Vector2(900,-100),PI/2,200,0.1,1,start_time+4,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(900,-100),PI/2,400,0.1,4,start_time+5,3,Vector2(100,0))
	
	generate_field(comet_scene,Vector2(1180,-100),PI/2,200,0.1,1,start_time+5,3,Vector2(100,0))
	generate_field(comet_scene,Vector2(1180,-100),PI/2,400,0.1,4,start_time+6,3,Vector2(100,0))
	
	
	#generate_field(comet_scene,Vector2(500,-100),PI/3,400,0.1,5,start_time+6,7,Vector2(150,0))
	#generate_field(asteroid_scene,Vector2(1280+100,500),1.005*PI,100,2,4,start_time+7,1,Vector2(0,400))
	#generate_field(comet_scene,Vector2(1280+100,400),1.1*PI,400,0.3,4,start_time+10,7,Vector2(0,200))
	return level_duration
