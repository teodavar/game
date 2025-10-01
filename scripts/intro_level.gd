extends planet_level

# Called when the node enters the scene tree for the first time.
func ready():
	super._ready()
func play(start_time=0):
	level_duration=30
	set_flip()
	print("begin intro level")
	#generate_field(comet_scene,$CometPath,3*PI/4,200,0.4,25,0,3)
	#generate_field(asteroid_scene,$spawnpath,0,100,6,23,6,1)
	#generate_field(asteroid_scene,$sp3,PI,80,0,0,16,1)
	generate_field(comet_scene,Vector2(730,-200),3*PI/4,200,0.6,25,0,3,Vector2(700,0))
	generate_field(comet_scene,Vector2(1280+200,280),3*PI/4,200,0.6,25,0,3,Vector2(0,370))
	generate_field(asteroid_scene,Vector2(-100,200),PI/50,100,6,23,6,1,Vector2(0,100))
	generate_field(asteroid_scene,Vector2(1280+200,250),PI+PI/50,80,0,0,16,1,Vector2(0,150))

	return level_duration
