extends Node2D
@export var objectsc: PackedScene
@export var duration=6
@export var direction=PI/4
@export var speed=100
@export var refire=false
@export var refire_speed=0.1
@export var startime=1
@export var startp=Vector2(0,0)
@export var pathex: Path2D
@export var N=1
@export var variance=Vector2(0,0)
var particular = false
var objectp
var path
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (path==null):
		if (pathex!=null):
			path=pathex
		else:
			path=$path
	#print("$StartTimer.wait_time",$StartTimer.wait_time)
	if (startime>0) :
		$StartTimer.wait_time=startime
		$StartTimer.start() # Replace with function body.
	else:
		firefirst()

func init(objectsci,pathi,directioni=PI/2,speedi=100,refirei=0,durationi=0,starti=0,Ni=1,Var=Vector2(0,0)):
	if objectsci is not PackedScene:
		objectp = objectsci
		particular = true
		N=1
		refire_speed=0
		duration=0
	else:
		objectsc=objectsci
		refire_speed=refirei
		N=Ni
		duration=durationi
	direction=directioni
	speed=speedi
	path=pathi
	
	startime=starti
	variance=Var
	if (refire_speed!=0):
		refire=true
		$refire.wait_time=refire_speed
	else:
		refire=false
	return self
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fire():
	
	for i in range(0,N):
		var object
		if particular == true:
			object=objectp
		else:
			object=objectsc.instantiate()
		#var spawn_spawn_location = $CometPath/CometSpawn
		#comet_spawn_location.progress_ratio = randf()
		#comet.position= comet_spawn_location.position
		var random_x = randf_range(-1, 1)
		var random_y = randf_range(-1, 1)
		var random_vector = Vector2(random_x, random_y)
		if (path is Vector2):
			object.position = path+random_vector*variance
		elif (path is Path2D):
			var follow=PathFollow2D.new()
			path.add_child(follow)
			follow.progress_ratio = randf()
			#print(follow)
			object.position= follow.position #+random_vector*variance
		#print(object.position)
		#comet.position=Vector2(640, 600)# Replace with function body.
		object.rotation= direction
		var scale=randf_range(0.5,2)
		object.reshape(scale)
		var velocity=Vector2(randf_range(speed*0.5,speed*2 ),0)
		object.linear_velocity = velocity.rotated(direction)
		if object.is_inside_tree():
			print("given planet")
			object.show()
		else:
			add_child(object)
		
func firefirst():
	fire()
	
	$StartTimer.stop()
	#print("refire ",refire)
	if refire==true:
		$refire.start()
		#print("$duration.wait_time",$duration.wait_time)
		if (duration>0 ):
			$duration.wait_time=duration
			$duration.start()# Replace with function body.
func _on_start_timer_timeout() -> void:
	firefirst()


func _on_refire_timeout() -> void:
	fire() # Replace with function body.


func _on_duration_timeout() -> void:
	$refire.stop()
	#print("stop fire")
	$duration.stop() # Replace with function body.
