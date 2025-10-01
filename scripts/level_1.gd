extends level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play():
	level_duration=10
	var huge_asteroid=self.asteroid_scene.instantiate()
	huge_asteroid.reshape(4)
	huge_asteroid.rotation+=PI
	generate_field(comet_scene,Vector2(150,0),PI/2,300,0.3,3,1,3,Vector2(150,0))
	generate_field(comet_scene,Vector2(600,0),PI/2,300,0.3,3,5,3,Vector2(150,0))
	generate_field(huge_asteroid,Vector2(1100,1300),-PI/2-PI/24,75,0,0,0,1,Vector2(50,0))
