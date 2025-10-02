extends space_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(start_time=0):
	#set_flip()
	level_duration=20
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(1.8)
	huge_asteroid.rotation+=0
	generate_field(huge_asteroid,Vector2(100,720+200),-PI/4,75,0,0,start_time+0,1,Vector2(5,0),Vector2(0.9,1.1))
	generate_field(comet_scene,Vector2(-100,720),-PI/10,400,0.1,3,start_time+2,7,Vector2(0,100))
	generate_field(comet_scene,Vector2(500,-100),PI/3,400,0.1,0.5,start_time+6,7,Vector2(150,0))
	generate_field(comet_scene,Vector2(500,-100),PI/3,400,0.1,4.5,start_time+6.5,7,Vector2(150,0))
	generate_field(asteroid_scene,Vector2(1280+100,500),1.005*PI,100,2,4,start_time+7,1,Vector2(0,400))
	generate_field(comet_scene,Vector2(1280+100,400),1.1*PI,400,0.3,4,start_time+10,7,Vector2(0,200))
	return level_duration
