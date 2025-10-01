class_name level extends Node2D
@export var comet_scene= load("res://scene/comets.tscn")
@export var asteroid_scene= load("res://scene/asteroid.tscn")
@export var field_scene= load("res://scene/spaceobjectsingle.tscn")
@export var planet_scene= load("res://scene/planet.tscn")
#https://nineplanets.org/planets-transparent-background/
@export var screen_size=Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size= get_viewport_rect().size
	# Replace with function body.
	#following function was given by AI
func circular_slice(array_to_slice: Array, start_index: int, end_index: int) -> Array:
	var array_size = array_to_slice.size()
	
	# Handle negative indices by converting them to positive equivalents
	start_index = (start_index % array_size + array_size) % array_size
	end_index = (end_index % array_size + array_size) % array_size
	
	var result_array = []
	
	if start_index <= end_index:
		# Standard slice when the range doesn't wrap around
		result_array = array_to_slice.slice(start_index, end_index + 1)
	else:
		# When the slice wraps around, combine two slices
		# Slice from start_index to the end of the array
		var first_part = array_to_slice.slice(start_index, array_size)
		# Slice from the beginning of the array to end_index
		var second_part = array_to_slice.slice(0, end_index + 1)
		result_array = first_part + second_part
		
	return result_array

func slice_path(path,centre,length):
	var newp
	if length>=0.5:
		newp=path
	else:
		var baked_points = path.curve.get_baked_points()
		var L=baked_points.size()
		var start_index = int(L*centre)-int(L*length)  # Example start index
		var end_index = int(L*centre)+int(L*length)  
		print(start_index," ",end_index," ",L)  # Example end index
		var portion_points =circular_slice(baked_points,start_index, end_index)
		var new_curve = Curve2D.new()
		for point in portion_points:
			new_curve.add_point(point)
		var new_path2d = Path2D.new()
		new_path2d.curve = new_curve
		#add_child(new_path2d)
		newp=new_path2d
		return newp
		
func pick_random_fva(va):
	var L=va.size()
	return va.get(randi_range(0, L))
func get_random_direction(path,variance=PI/12):
	var baked_points = path.curve.get_baked_points()
	var point=pick_random_fva(baked_points)
	var centre=screen_size/2
	var angle=(centre-point).angle()
	return randf_range(angle-variance,angle+variance)
	
func generate_field(object,spawn_path,direction,speed,refire_speed,fire_duration,start_time,objects_perfire):
	if not spawn_path.is_inside_tree():
		add_child(spawn_path)
	add_child(field_scene.instantiate().init(object,spawn_path,direction,speed,refire_speed,fire_duration,start_time,objects_perfire))
	
func generate_random_field(object):
	var path=slice_path($asteroid_spawn,randf_range(0,1),randf_range(0.05,0.3))
	var dir=get_random_direction(path)
	var speed=randi_range(200,400)
	var refire=randf_range(0.05,0.5)
	var duration=randi_range(1,10)
	var num=randi_range(3,5)
	generate_field(object,path,dir,speed,refire,duration ,0,num)
	return 0
	
	
	#add_child(field_scene.instantiate().init(comet_scene,newp,PI/4,100,0.1,8,0,3))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func play():
	print("begin random field")
	generate_random_field(comet_scene)

	#add_child(field_scene.instantiate().init(asteroid_scene,$right,0,80,3,4,8,1))
	#add_child(field_scene.instantiate().init(comet_scene,$left,PI,200,0.5,6,18,1))

	return 0
