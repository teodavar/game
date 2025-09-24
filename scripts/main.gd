extends Node
@export var comet_scene: PackedScene
@export var asteroid_scene: PackedScene
@export var field_scene: PackedScene
var score
signal reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	#reset.emit()
	
	
func new_game():
	score=0
	$Spaceship.start($StartPosition.position)
	$StartTimer.start()
	print("begin")
	add_child(field_scene.instantiate().init(comet_scene,$CometPath,3*PI/4,200,0.5,0,0,3))
	add_child(field_scene.instantiate().init(asteroid_scene,$CometPath,3*PI/4,100,1,0,0,1))
func _on_spaceship_hit() -> void:
	#print("11111111")
	#reset.emit()
	score=0
	#$Spaceship.haha()
	#$Spaceship.start($StartPosition.position) 
	#get_tree().call_group("comets2", "queue_free")


func _on_comet_timer_timeout() -> void:
	var comet=comet_scene.instantiate()
	var comet_spawn_location = $CometPath/CometSpawn
	comet_spawn_location.progress_ratio = randf()
	comet.position= comet_spawn_location.position
	#print(comet_spawn_location.position)
	#comet.position=Vector2(640, 600)# Replace with function body.
	var direction = 3*PI/4
	comet.rotation= direction-PI/2
	comet.scale=Vector2(randf_range(0.8,1.2 ),0)
	var velocity=Vector2(randf_range(200*0.9,200*1.1 ),0)
	comet.linear_velocity = velocity.rotated(direction)
	add_child(comet)
	
	
func _on_score_timer_timeout() -> void:
	score+=1 # Replace with function body.


func _on_start_timer_timeout() -> void:
	#$CometTimer.start()
	$ScoreTimer.start()
	
	
	 # Replace with function body.
