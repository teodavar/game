class_name easy_level extends level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready() # Replace with function body.
	asteroid_preset={
	"path":$asteroid_spawn,
	"pathc_min":0,"pathc_max":1,"pathl_min":0.04,"pathl_max":0.2,
							"speed_min":90,"speed_max":150,"refire_min":1.5,"refire_max":4,
							"duration_min":5,"duration_max":15,
							"num_min":1,"num_max":1,"Svar":Vector2(0.5,2)
	
	}

	comet_preset={
	"path":$comet_spawn,
	"pathc_min":0,"pathc_max":1,"pathl_min":0.01,"pathl_max":0.1,
							"speed_min":150,"speed_max":300,"refire_min":0.2,"refire_max":0.6,
							"duration_min":2,"duration_max":10,
							"num_min":2,"num_max":5,"Svar":Vector2(0.7,1.4)
	
	}	
	comet_preset_narrow={
	#"path":$comet_spawn,
	"pathc_min":0,"pathc_max":1,"pathl_min":0.01,"pathl_max":0.04,
							"speed_min":280,"speed_max":350,"refire_min":0.1,"refire_max":0.5,
							"duration_min":2,"duration_max":10,
							"num_min":3,"num_max":5,"Svar":Vector2(0.7,1.4)
	
		}
	comet_preset_wide={
	"path":$comet_spawn,
	"pathc_min":0,"pathc_max":1,"pathl_min":0.03,"pathl_max":0.12,
							"speed_min":75,"speed_max":150,"refire_min":0.2,"refire_max":0.6,
							"duration_min":5,"duration_max":10,
							"num_min":1,"num_max":3,"Svar":Vector2(0.7,1.4)
	
	}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	super._process(delta)
