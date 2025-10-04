extends level


func play(start_time=0):
	#var offset=randf_range(0,1)
	#var customa= asteroid_preset.copy()
	#var customc=comet_preset.copy()
	level_duration=23
	
	generate_random_field(comet_scene,1)
	generate_random_field(asteroid_scene,2,asteroid_preset)
	generate_random_field(comet_scene,8)
	if dif_level>1:
		generate_random_field(comet_scene,13)
	return level_duration
