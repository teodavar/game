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
	huge_asteroid.change_collision()
	generate_field(comet_scene,Vector2(200,0),PI/2,300,0.2,5,start_time+1,3,Vector2(200,0))
	generate_field(comet_scene,Vector2(600,0),PI/2,150,0.3,1,start_time+6,1,Vector2(100,0))
	generate_field(comet_scene,Vector2(600,0),PI/2,300,0.3,8,start_time+6.8,3,Vector2(100,0))
	generate_field(huge_asteroid,Vector2(1100,1500),-PI/2-PI/24,75,0,0,start_time+0,1,Vector2(50,0),Vector2(1,1))
	generate_field(comet_scene,Vector2(-100,890),-PI/6,200,0.3,3,start_time+7.5,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,890),-PI/6,400,0.3,3,start_time+8.5,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,400),-PI/16,200,0.1,3,start_time+10,3,Vector2(0,50))
	generate_field(comet_scene,Vector2(-100,400),-PI/16,400,0.1,3,start_time+11,3,Vector2(0,50))
	return level_duration
