extends Node
@export var comet_scene: PackedScene
@onready var ship = $Spaceship
@onready var hud = $HUD

var score
#signal reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game() # Replace with function body.
	# Update HUD whenever lives change
	ship.connect("lives_changed", Callable(hud, "_on_lives_changed"))
	 # Show game over when ship dies
	ship.connect("died", Callable(self, "_on_ship_died"))
	hud.update_lives(ship.lives)
	
	# Initialize HUD text
	hud.update_lives(ship.lives)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	#reset.emit()
	
	
func new_game():
	score=0
	$Spaceship.start($StartPosition.position)
	$StartTimer.start()
	

#func _on_spaceship_hit() -> void:
	
	#print("11111111")
	#reset.emit()
	#score=0
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
	
func _on_ship_died() -> void:
	hud.show_game_over()
	ship.set_process(false)
	ship.set_physics_process(false)
	
func _on_lives_changed(current: int) -> void:
	hud.update_lives(current)
	

	
	

	

	
