extends TextureButton


signal place_room_at(coord:Vector2)


func _on_pressed() -> void:
	var center = global_position - size * 0.5
	emit_signal("place_room_at", MapMath.pos_to_coord(center))
