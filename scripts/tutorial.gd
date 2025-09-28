extends Node2D
@export var comet_scene= load("res://scripts/comets.gd")
@export var asteroid_scene= load("res://scripts/asteroid.gd")
@export var field_scene= load("res://scripts/spaceobjectsingle.gd")
var screen_size=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size= get_viewport_rect().size
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func play():
	print("begin tutorial")
	add_child(field_scene.instantiate().init(comet_scene,$up,PI/2,100,1,4,2,1))
	add_child(field_scene.instantiate().init(comet_scene,$left,PI/8,100,1,8,8,1))
	add_child(field_scene.instantiate().init(comet_scene,$right,PI,200,0.5,8,22,1))
	add_child(field_scene.instantiate().init(comet_scene,$up,PI/2,300,0.5,8,32,3))
	add_child(field_scene.instantiate().init(comet_scene,Vector2.ZERO,PI/4,300,0.5,8,38,4,Vector2(300,0)))
	add_child(field_scene.instantiate().init(comet_scene,Vector2(screen_size.x/2,0),PI-PI/4,300,0.5,8,50,4,Vector2(1000,0)))
	add_child(field_scene.instantiate().init(comet_scene,Vector2(screen_size.x,screen_size.y/2),PI-PI/4,300,0.5,8,50,4,Vector2(0,1000)))
	
	#add_child(field_scene.instantiate().init(asteroid_scene,$right,0,80,3,4,8,1))
	#add_child(field_scene.instantiate().init(comet_scene,$left,PI,200,0.5,6,18,1))

	return 0
