extends Node2D
@export var comet_scene: PackedScene
@export var asteroid_scene: PackedScene
@export var field_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func play():
	print("begin intro level")
	add_child(field_scene.instantiate().init(comet_scene,$CometPath,3*PI/4,200,0.4,0,0,3))
	add_child(field_scene.instantiate().init(asteroid_scene,$spawnpath,0,100,6,0,6,1))
	add_child(field_scene.instantiate().init(asteroid_scene,$sp3,PI,50,0,0,18,1))

	return 0
