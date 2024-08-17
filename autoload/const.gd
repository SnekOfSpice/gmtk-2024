extends Node

const REVEAL_FADE_TIME := 1.0

const MAX_WIDTH := 10
const WIDTH_COORD_LIMIT := Vector2(-10, 10)
const FLOOR_UNIT_WIDTH := 32
const FLOOR_UNIT_HEIGHT := 72
const BUILDING_ORIGIN_POS := Vector2(0, -FLOOR_UNIT_HEIGHT)
const BUILDING_ORIGIN_COORD := Vector2.ZERO

const NEIGHBOR_OFFSETS := [
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
]


const ZOOM_MIN := 0.25
const ZOOM_MAX := 4.0
const ZOOM_STEP := 0.025
const CAMERA_MOVE_STEP := 300
