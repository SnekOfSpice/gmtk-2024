extends Node2D

@onready var add_floor_container : CenterContainer = find_child("AddFloorContainer")



func _ready() -> void:
	GameState.set_state(GameState.State.Building)
	Data.property_changed.connect(on_property_changed)
	
	Data.apply("cash", 5000)

func on_property_changed(property_name:String, old_value, new_value):
	match property_name:
		"cash":
			find_child("CashLabel").text = str(new_value)

func start_month():
	pass
	# get empty flats
	
	var flats = $Building.get_flats()
	# generate tenants for all of them


func _on_building_query_add_floor(coord: Vector2) -> void:
	add_floor_container.show_menu(coord)


func _on_finish_stage_button_pressed() -> void:
	if GameState.state == GameState.State.Managing:
		GameState.set_state(GameState.State.Building)
	elif GameState.state == GameState.State.Building:
		GameState.set_state(GameState.State.PickingTenants)
	elif GameState.state == GameState.State.PickingTenants:
		GameState.set_state(GameState.State.Managing)
