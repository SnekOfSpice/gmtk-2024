extends Area2D
class_name Floor

@onready var seethrough_tween : Tween
# is assumed to be there in all scenes that inherit from this
@onready var hover_area := $HoverArea
@onready var front_wall := $FrontWall
@onready var rooms := $Rooms

var offset := Vector2.ZERO

func update_walls():
	pass

func _ready():
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	
	hover_area.shape.size.x = CONST.FLOOR_UNIT_WIDTH * CONST.MAX_WIDTH
	hover_area.shape.size.y = CONST.FLOOR_UNIT_HEIGHT

# note: can return null
func get_unit(index:int) -> FloorUnit:
	var found_unit:FloorUnit
	for unit : FloorUnit in $Units.get_children():
		if unit.h_index == index:
			found_unit = unit
			break
	return found_unit

func add_unit_at(coord:Vector2):
	var is_empty := $Units.get_child_count() == 0
	var target_pos = MapMath.coord_to_pos(coord)
	var unit = preload("res://src/floor/floor_unit.tscn").instantiate()
	$Units.add_child(unit)
	unit.global_position = target_pos + offset
	unit.h_index = coord.x

func on_mouse_entered():
	if Data.of("global.permanent_reveal"):
		return
	if seethrough_tween:
		seethrough_tween.kill()
	seethrough_tween = create_tween()
	seethrough_tween.tween_property(front_wall, "modulate:a", 0, CONST.REVEAL_FADE_TIME).set_ease(Tween.EASE_OUT_IN)

func on_mouse_exited():
	if Data.of("global.permanent_reveal"):
		return
	if seethrough_tween:
		seethrough_tween.kill()
	seethrough_tween = create_tween()
	seethrough_tween.tween_property(front_wall, "modulate:a", 1, CONST.REVEAL_FADE_TIME).set_ease(Tween.EASE_OUT_IN)

func add_room(coord: Vector2, room_type:CONST.RoomType):
	var room = preload("res://src/rooms/room.tscn").instantiate()
	$Rooms.add_child(room)
	
	room.global_position = MapMath.coord_to_pos(coord) + offset
	room.room_type = room_type

func build_front_wall():
	pass
	# needs to be based on the appearance of each underlying unit for balconies
	# always override on the right most side with corresponding sprite
