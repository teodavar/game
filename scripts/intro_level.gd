extends level


# Called when the node enters the scene tree for the first time.

func play():
	print("begin intro level")
	add_child(field_scene.instantiate().init(comet_scene,$CometPath,3*PI/4,200,0.4,30,0,3))
	add_child(field_scene.instantiate().init(asteroid_scene,$spawnpath,0,100,6,30,6,1))
	add_child(field_scene.instantiate().init(asteroid_scene,$sp3,PI,50,0,0,18,1))

	return 0
