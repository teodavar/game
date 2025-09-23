extends Node2D
@export var objectsc: PackedScene
@export var duration=6
@export var direction=PI/4
@export var speed=100
@export var refire=false
@export var refire_speed=0.1
@export var startime=1
@export var startp=Vector2(0,0)
@export var path: Path2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (path==null):
		path=$path
	$StartTimer.wait_time=startime
	$StartTimer.start() # Replace with function body.

func init(objectsci,startpi,pathi,directioni,speedi,refirei,durationi,starti):
	objectsc=objectsci
	startp=startpi
	duration=durationi
	direction=directioni
	speed=speedi
	path=pathi
	refire_speed=refirei
	if (refirei!=0):
		refire=true
		$refire.wait_time=refire_speed
	else:
		refire=false
	$duration.wait_time=duration
	
	$StartTimer.wait_time=starti
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fire():
	var object=objectsc.instantiate()
	#var spawn_spawn_location = $CometPath/CometSpawn
	#comet_spawn_location.progress_ratio = randf()
	#comet.position= comet_spawn_location.position
	if (path==null):
		object.position = startp
	else:
		var follow=PathFollow2D.new()
		path.add_child(follow)
		follow.progress_ratio = randf()
		object.position= follow.position
	print(object.position)
	#comet.position=Vector2(640, 600)# Replace with function body.
	object.rotation= direction
	var velocity=Vector2(speed,0)
	object.linear_velocity = velocity.rotated(direction)
	add_child(object)
func _on_start_timer_timeout() -> void:
	fire()
	$StartTimer.stop()
	if refire==true:
		$refire.start()
		$duration.start()# Replace with function body.


func _on_refire_timeout() -> void:
	fire() # Replace with function body.


func _on_duration_timeout() -> void:
	$refire.stop()
	print("stop fire")
	$duration.stop() # Replace with function body.
