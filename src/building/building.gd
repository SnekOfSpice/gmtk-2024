extends Node2D
class_name Building

@onready var ground_floor : Floor = find_child("GroundFloor")
@onready var add_unit_button : TextureButton = $AddUnitButton

signal query_add_floor(coord:Vector2)

func _ready() -> void:
	GameState.building = self
	ground_floor.player_owned = true
	for i in 6:
		ground_floor.add_unit_at(Vector2(i, 0))


func _process(delta: float) -> void:
	var target_pos = get_local_mouse_position() - (add_unit_button.size * 0.25)
	add_unit_button.position = lerp(add_unit_button.position, target_pos, 0.2)
	
	var button_coord = add_unit_button.get_current_coord()
	add_unit_button.visible = can_coord_be_added(button_coord)
	
func has_floor(index: int) -> bool:
	return get_floor(index) != null

func get_floor(index: int) -> Floor:
	index = abs(index)
	if index >= $Floors.get_child_count():
		return null
	return $Floors.get_child(index)

func add_floor_by_coord(coord: Vector2):
	add_floor(coord.x)

func add_floor(horizontal_index:int):
	var floor_count = $Floors.get_child_count()
	var floor = preload("res://src/floor/floor.tscn").instantiate()
	floor.player_owned = true
	$Floors.add_child(floor)
	floor.position = MapMath.coord_to_pos(Vector2(horizontal_index, -floor_count))# - global_position
	floor.add_unit_at(Vector2(horizontal_index, -floor_count))

func is_coord_free(coord: Vector2) -> bool:
	var floor := get_floor(coord.y)
	if not floor:
		return true
	return floor.get_unit(coord.x) == null

func is_coord_adjacent(coord: Vector2) -> bool:
	var has_adjacent:=false
	for offset in CONST.NEIGHBOR_OFFSETS:
		if not is_coord_free(coord + offset):
			has_adjacent = true
			break
	return has_adjacent

func can_coord_be_added(coord: Vector2):
	if not is_coord_free(coord):
		return false
	if not is_coord_adjacent(coord):
		return false
	if coord.y > 0:
		return false
	
	# only allow free-hanging units with 1 offset
	var floor_beneath := get_floor(abs(coord.y) - 1)
	if floor_beneath:
		var unit_beneath = floor_beneath.get_unit(coord.x)
		if not unit_beneath:
			var has_offset_step = floor_beneath.get_unit(coord.x - 1) != null or floor_beneath.get_unit(coord.x + 1) != null
			if not has_offset_step:
				return false
	
	return coord.x >= CONST.WIDTH_COORD_LIMIT.x and coord.x <= CONST.WIDTH_COORD_LIMIT.y

func request_add_unit(coord: Vector2):
	if not has_floor(coord.y):
		emit_signal("query_add_floor", coord)
		return
	var floor := get_floor(coord.y)
	floor.add_unit_at(coord)

func _on_add_unit_button_place_room_at(coord: Vector2) -> void:
	request_add_unit(coord)
