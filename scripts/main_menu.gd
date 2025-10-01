extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene/intro_scene.tscn")

func _on_quite_pressed():
	get_tree().quit()


func _on_play_mouse_entered():
	$Hover.play()


func _on_quit_mouse_entered():
	$Hover.play()
