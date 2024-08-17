extends Node2D

@onready var ground_floor : Floor = $GroundFloor

func _ready() -> void:
	ground_floor.position = CONST.BUILDING_ORIGIN_COORD
	for i in 6:
		ground_floor.add_unit_at(Vector2(i, 0))
