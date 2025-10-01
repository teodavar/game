extends space_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(start_time=0):
	level_duration=15
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(4)
	huge_asteroid.rotation+=PI
	generate_field(comet_scene,Vector2(200,0),PI/2,300,0.2,5,start_time+1,3,Vector2(200,0))
	generate_field(comet_scene,Vector2(650,0),PI/2,300,0.3,4,start_time+6.5,3,Vector2(150,0))
	generate_field(huge_asteroid,Vector2(1100,1500),-PI/2-PI/24,75,0,0,start_time+0,1,Vector2(50,0))
	generate_field(comet_scene,Vector2(-100,690),-PI/5,200,0.2,3,start_time+8,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,690),-PI/5,400,0.2,3,start_time+9,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,200,0.2,3,start_time+10,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,400,0.2,3,start_time+11,3,Vector2(0,50))
	return level_duration
