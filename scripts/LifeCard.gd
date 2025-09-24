extends Control
class_name LifeCard

@onready var icon: TextureRect = $Panel/VBoxContainer/TextureRect
@onready var label: Label = $Panel/VBoxContainer/Label
@onready var anim: AnimationPlayer = $AnimationPlayer

func set_icon(tex: Texture2D) -> void:
	icon.texture = tex
	
func set_caption(text: String) -> void:
	label.text = text
	
func  play_hit_feedback() -> void:
	# small shake/flash to show damage (no life lost yet)
	anim.play("hit")
	
func play_lost_feedback() -> void:
	 # fade/scale out when a life is consumed
	anim.play("lost")
	
