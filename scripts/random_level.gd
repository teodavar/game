extends level


func play(start_time=0):
	level_duration=20
	generate_random_field(comet_scene,1,comet_preset_wide)
	generate_random_field(asteroid_scene,2,asteroid_preset)
	#print(comet_preset_narrow)
	generate_random_field(comet_scene,8,comet_preset_narrow)
	generate_random_field(comet_scene,13,comet_preset)
	
	return 20
