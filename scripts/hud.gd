extends CanvasLayer

#@onready var lives_label: Label = $LivesLabel
@onready var cards: Array[LifeCard] = [
	$Cards/Card1 as LifeCard,
	$Cards/Card2 as LifeCard,
	$Cards/Card3 as LifeCard
]

# optional: placeholder textures (all same for now)
var placeholder_icon: Texture2D

func _ready() -> void:
	placeholder_icon = load("res://assets/Textures/heart (3).png") as Texture2D # replace later with real PNGs
	
	#initialize captions and icons
	cards[0].set_caption("Terraform")
	cards[1].set_caption("Life Support")
	cards[2].set_caption("Provisions")
	for c in cards:
		c.set_icon(placeholder_icon)
		c.visible = true
		c.scale = Vector2.ONE
		c.modulate = Color(1,1,1,1)

func update_lives(current: int) -> void:
	#lives_label.text = "Lives: %d" % current
	# load a single placeholder icon
	
	# show hit feedback on the life that was just lost (if shrinking)
	# lives go 3→2→1→0. We’ll remove from right to left for drama.
	# First, play hit on the card that will be lost next (if any).
	
	if current >= 0 and current < cards.size():
		var index_to_remove = clamp(current, 0, cards.size()-1)
		for i in range (cards.size()):
			if i >= current:
				if cards[i].visible:
					cards[i].play_hit_feedback()
					await get_tree().create_timer(0.05).timeout
					cards[i].play_lost_feedback()
	for i in range(current):
		if not cards[i].visible:
			cards[i].visible = true
			cards[i].scale = Vector2.ONE
			cards[i].modulate = Color(1,1,1,1)
			
	
	
	
func show_game_over() -> void:
	#lives_label.text = "Game Over"
	for c in cards:
		if c.visible:
			c.play_lost_feedback()
