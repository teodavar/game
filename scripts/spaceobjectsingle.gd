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

func init(objectsci,pathi,directioni=PI/2,speedi=100,refirei=0,durationi=0,starti=0,Ni=1):
	objectsc=objectsci
	print("new ojects")
	N=Ni
	#startp=startpi
	duration=durationi
	direction=directioni
	speed=speedi
	path=pathi
	refire_speed=refirei
	startime=starti
	if (refirei!=0):
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
		var object=objectsc.instantiate()
		#var spawn_spawn_location = $CometPath/CometSpawn
		#comet_spawn_location.progress_ratio = randf()
		#comet.position= comet_spawn_location.position
		if (path is Vector2):
			object.position = path
		elif (path is Path2D):
			var follow=PathFollow2D.new()
			path.add_child(follow)
			follow.progress_ratio = randf()
			object.position= follow.position
		#print(object.position)
		#comet.position=Vector2(640, 600)# Replace with function body.
		object.rotation= direction
		var scale=randf_range(0.5,2)
		#object.scale*=scale
		var velocity=Vector2(randf_range(speed*0.9,speed*1.1 ),0)
		object.linear_velocity = velocity.rotated(direction)
		add_child(object)
		
func firefirst():
	fire()
	
	$StartTimer.stop()
	print("refire ",refire)
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
	print("stop fire")
	$duration.stop() # Replace with function body.
