extends Node2D



@export var room_type: CONST.RoomType:
	set(value):
		match value:
			CONST.RoomType.Kitchen:
				$Sprite2D.texture = load("res://src/floor/kitchen.png")
			CONST.RoomType.Bathroom:
				$Sprite2D.texture = load("res://src/floor/bathroom.png")
			CONST.RoomType.Livingroom:
				$Sprite2D.texture = load("res://src/floor/livingroom.png")
			CONST.RoomType.Bedroom:
				$Sprite2D.texture = load("res://src/floor/bedroom.png")
			CONST.RoomType.Hallway:
				$Sprite2D.texture = load("res://src/floor/hallway.png")
			CONST.RoomType.Storeroom:
				$Sprite2D.texture = load("res://src/floor/storeroom.png")
			CONST.RoomType.Office:
				$Sprite2D.texture = load("res://src/floor/office.png")
			CONST.RoomType.Fitnessroom:
				$Sprite2D.texture = load("res://src/floor/fitness.png")
			CONST.RoomType.Garage:
				$Sprite2D.texture = load("res://src/floor/garage.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
