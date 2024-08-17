extends Area2D
class_name Floor

@onready var seethrough_tween := create_tween()
# is assumed to be there in all scenes that inherit from this
@onready var hover_area := $HoverArea
@onready var front_wall := $FrontWall
@onready var room_visuals := $RoomVisuals



func _ready():
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

func add_unit_at(coord:Vector2):
	var target_pos = MapMath.coord_to_pos(coord)
	var unit = preload("res://src/floor/floor_unit.tscn").instantiate()
	$Units.add_child(unit)
	unit.global_position = target_pos

func on_mouse_entered():
	if Data.of("global.permanent_reveal"):
		return
	seethrough_tween.kill()
	seethrough_tween = create_tween()
	seethrough_tween.tween_property(front_wall, "modulate:a", 0, CONST.REVEAL_FADE_TIME).set_ease(Tween.EASE_OUT_IN)

func on_mouse_exited():
	if Data.of("global.permanent_reveal"):
		return
	seethrough_tween.kill()
	seethrough_tween = create_tween()
	seethrough_tween.tween_property(front_wall, "modulate:a", 1, CONST.REVEAL_FADE_TIME).set_ease(Tween.EASE_OUT_IN)

func build_front_wall():
	pass
	# needs to be based on the appearance of each underlying unit for balconies
	# always override on the right most side with corresponding sprite
