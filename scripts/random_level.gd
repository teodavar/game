extends level


func play():
	generate_random_field(comet_scene,4)
	generate_random_field(asteroid_scene,5,asteroid_preset)
	generate_random_field(comet_scene,12)
	generate_random_field(comet_scene,17)
	return 0
