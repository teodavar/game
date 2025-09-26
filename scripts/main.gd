extends Node
@export var comet_scene: PackedScene
@export var asteroid_scene: PackedScene
@export var field_scene: PackedScene

# XX
@onready var hud = $HUD
@onready var ship = $Spaceship

var score
signal reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game() # Replace with function body.

	# Update HUD whenever lives change
	ship.connect("lives_changed", Callable(hud, "_on_lives_changed"))
	 # Show game over when ship dies
	ship.connect("died", Callable(self, "_on_ship_died"))
	hud.update_lives(ship.lives)
	#hud.init_lives(ship.lives)
	
	# Initialize HUD text
	hud.update_lives(ship.lives)

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
	add_child(field_scene.instantiate().init(comet_scene,$CometPath,3*PI/4,200,0.5,4,0,3))
	add_child(field_scene.instantiate().init(asteroid_scene,$spawnpath,0,100,1,4,8,1))
	add_child(field_scene.instantiate().init(asteroid_scene,$sp3,PI,50,0,0,18,1))

#func _on_spaceship_hit() -> void:
	#print("11111111")
	#reset.emit()
	#score=0
	#$Spaceship.haha()
	#$Spaceship.start($StartPosition.position) 
	#get_tree().call_group("comets2", "queue_free")



	
	
func _on_score_timer_timeout() -> void:
	score+=1 # Replace with function body.


func _on_start_timer_timeout() -> void:
	$ScoreTimer.start()

func _on_ship_died() -> void:
	hud.show_game_over()
	#ship.set_process(false)
	#ship.set_physics_process(false)
	
func _on_lives_changed(current: int) -> void:
	hud.update_lives(current)
