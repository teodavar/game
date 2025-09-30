extends Node2D
@export var comet_scene= load("res://scene/comets.tscn")
@export var asteroid_scene= load("res://scene/asteroid.tscn")
@export var field_scene= load("res://scene/spaceobjectsingle.tscn")
@export var planet_scene= load("res://scene/planet.tscn")
#https://nineplanets.org/planets-transparent-background/
var screen_size=Vector2.ZERO
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

func generate_field(centre,length):
	var newp
	if length>=0.5:
		newp=$comet_spawn
	else:
		var baked_points = $comet_spawn.curve.get_baked_points()
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
		add_child(new_path2d)
		newp=new_path2d
	add_child(field_scene.instantiate().init(comet_scene,newp,PI/4,100,0.1,8,0,3))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func play():
	print("begin tutorial")
	var saturn=planet_scene.instantiate()
	saturn.setplanet("saturn")
	add_child(field_scene.instantiate().init(comet_scene,$up,PI/2,100,1,4,2,1))
	add_child(field_scene.instantiate().init(comet_scene,$left,PI/8,100,1,8,8,1))
	add_child(field_scene.instantiate().init(comet_scene,$right,PI,200,0.5,8,22,1))
	add_child(field_scene.instantiate().init(asteroid_scene,Vector2(500+screen_size.x,screen_size.y/3),PI,75,8,30,20,1,Vector2(0,400)))
	add_child(field_scene.instantiate().init(saturn,Vector2(50,-screen_size.y),PI/2,25,0,0,1,1,Vector2(100,0)))
	add_child(field_scene.instantiate().init(comet_scene,$up,PI/2,300,0.5,8,32,3))
	add_child(field_scene.instantiate().init(comet_scene,Vector2.ZERO,PI/4,300,0.5,8,38,4,Vector2(300,0)))
	add_child(field_scene.instantiate().init(comet_scene,Vector2(screen_size.x/2,0),PI-PI/4,300,0.5,8,50,4,Vector2(1000,0)))
	add_child(field_scene.instantiate().init(comet_scene,Vector2(screen_size.x,screen_size.y/2),PI-PI/4,300,0.5,8,50,4,Vector2(0,1000)))
	
	#add_child(field_scene.instantiate().init(asteroid_scene,$right,0,80,3,4,8,1))
	#add_child(field_scene.instantiate().init(comet_scene,$left,PI,200,0.5,6,18,1))

	return 0
