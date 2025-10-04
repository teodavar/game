extends planet_level


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func play(start_time=0):
	level_duration=4
	generate_planet("mercury" ,1.8,start_time+0,Vector2(100,-self.screen_size.y/2-100),PI/3,50,Vector2(100,0),Vector2(0.9,1.2))
	return level_duration
