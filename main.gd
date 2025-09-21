extends Node
@export var comet_scene: PackedScene
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
	comet.position= comet_spawn_location.position# Replace with function body.
	var direction = 3*PI/4
	comet.rotation= direction-PI/2
	var velocity=Vector2(200,0)
	comet.linear_velocity = velocity.rotated(direction)
	add_child(comet)
	
	
func _on_score_timer_timeout() -> void:
	score+=1 # Replace with function body.


func _on_start_timer_timeout() -> void:
	$CometTimer.start()
	$ScoreTimer.start()
	 # Replace with function body.
