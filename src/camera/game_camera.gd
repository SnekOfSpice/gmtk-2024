extends Camera2D

@onready var target_zoom := Vector2.ONE
@onready var target_position := position

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("zoom_in"):
		target_zoom.x = clamp(target_zoom.x + CONST.ZOOM_STEP, CONST.ZOOM_MIN, CONST.ZOOM_MAX)
		target_zoom.y = clamp(target_zoom.y + CONST.ZOOM_STEP, CONST.ZOOM_MIN, CONST.ZOOM_MAX)
	if event.is_action("zoom_out"):
		target_zoom.x = clamp(target_zoom.x - CONST.ZOOM_STEP, CONST.ZOOM_MIN, CONST.ZOOM_MAX)
		target_zoom.y = clamp(target_zoom.y - CONST.ZOOM_STEP, CONST.ZOOM_MIN, CONST.ZOOM_MAX)
	

func _physics_process(delta: float) -> void:
	zoom = lerp(zoom, target_zoom, 0.2)

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= CONST.CAMERA_MOVE_STEP * delta / zoom.x
	if Input.is_action_pressed("ui_down"):
		position.y += CONST.CAMERA_MOVE_STEP * delta / zoom.x
	if Input.is_action_pressed("ui_left"):
		position.x -= CONST.CAMERA_MOVE_STEP * delta / zoom.x
	if Input.is_action_pressed("ui_right"):
		position.x += CONST.CAMERA_MOVE_STEP * delta / zoom.x
	pass
