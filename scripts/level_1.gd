extends space_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(start_time=0):
	level_duration=15
	set_flip()
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(4)
	huge_asteroid.rotation+=PI
	generate_field(comet_scene,flip(Vector2(200,0)),flip(PI/2),300,0.2,5,start_time+1,3,Vector2(200,0))
	generate_field(comet_scene,flip(Vector2(650,0)),flip(PI/2),300,0.3,4,start_time+6.5,3,Vector2(150,0))
	generate_field(huge_asteroid,flip(Vector2(1100,1500)),flip(-PI/2-PI/24),75,0,0,start_time+0,1,Vector2(50,0))
	generate_field(comet_scene,flip(Vector2(-100,690)),flip(-PI/5),200,0.2,3,start_time+8,3,Vector2(0,50))
	generate_field(comet_scene,flip(Vector2(-100,690)),flip(-PI/5),400,0.2,3,start_time+9,3,Vector2(0,50))
	generate_field(comet_scene,flip(Vector2(-100,200)),flip(-PI/16),200,0.2,3,start_time+10,3,Vector2(0,50))
	generate_field(comet_scene,flip(Vector2(-100,200)),flip(-PI/16),400,0.2,3,start_time+11,3,Vector2(0,50))
	return level_duration
