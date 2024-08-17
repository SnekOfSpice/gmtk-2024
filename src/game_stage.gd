extends Node2D

@onready var add_floor_container : CenterContainer = find_child("AddFloorContainer")


func _on_building_query_add_floor(coord: Vector2) -> void:
	add_floor_container.show_menu(coord)


func _on_add_floor_container_confirm_add_floor(coord: Vector2) -> void:
	pass # Replace with function body.
