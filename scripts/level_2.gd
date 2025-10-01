extends level


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
	generate_field(huge_asteroid,Vector2(2100,313),-PI,80,0,0,start_time+0,1,Vector2(0,5))
	generate_field(comet_scene,Vector2(-100,313),0,200,0.1,4,start_time+7,5,Vector2(0,100))
	generate_field(comet_scene,Vector2(-100,313),0,450,0.1,5,start_time+8,7,Vector2(0,100))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,200,0.2,3,start_time+9,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,200),-PI/16,400,0.2,3,start_time+11,3,Vector2(0,50))
	return level_duration
