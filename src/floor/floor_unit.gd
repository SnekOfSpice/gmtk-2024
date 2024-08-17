extends Area2D
class_name FloorUnit

var h_index := 0

func _place_room_at(coord: Vector2) -> void:
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	if not area.is_in_group("hover_button"):
		return
	var button := area.get_parent()


func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group("hover_button"):
		return
	var button := area.get_parent()
