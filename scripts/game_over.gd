extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")
	$Clicked.play()


func _on_quit_pressed():
	get_tree().quit()
	$Clicked.play()

func _on_retry_button_mouse_entered():
	$Hover.play()


func _on_quit_mouse_entered():
	$Hover.play()
