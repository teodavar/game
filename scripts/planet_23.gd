extends planet_level


func play(start_time=0):
	level_duration=5
	generate_planet("venus" ,1.5,start_time+0,Vector2(100,-self.screen_size.y/2-100),PI/2,40,Vector2(100,0),Vector2(0.75,1.5))
	generate_planet("mars" ,1.6,start_time+0,Vector2(1180,-self.screen_size.y/2-100),PI/2,30,Vector2(100,0),Vector2(0.75,1.5))
	return level_duration
