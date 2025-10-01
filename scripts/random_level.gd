extends level


func play(start_time=0):
	level_duration=20
	generate_random_field(comet_scene,1)
	generate_random_field(asteroid_scene,2,asteroid_preset)
	generate_random_field(comet_scene,8)
	generate_random_field(comet_scene,13)
	return 0
