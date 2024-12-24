extends Node2D
const CARD_SLOT_PATH = "res://Scenes/card_slot.tscn"
@export var columns: int = 3
@export var rows: int = 4
@export var width_offset: int = 150
@export var hight_offset: int = 200
var first_slot_pos_x
var first_slot_pos_y
var slot_empty = true
var slot_available_for_drop = false
var slot_interactable = false
var slot_earth_points = 0
var slot_air_points = 0
var slot_water_points = 0
var slot_fire_points = 0
var slot_enemy_type = 0 #0 - land 1 - enemy 2 - bonus
var slot_player = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_slot_pos_x = get_viewport().size.x/2 - width_offset * columns/2 + width_offset/2
	first_slot_pos_y = get_viewport().size.y/2 - hight_offset * rows/2
	var card_slot = preload(CARD_SLOT_PATH)
	var array_number = 0
	for y in range(rows):
		for x in range(columns):
			#top slots interactable
			if y < 1 and x <= 3:
				slot_interactable = true
			else:
				slot_interactable = false
				
				
			var new_slot = card_slot.instantiate()
			add_child(new_slot)
			new_slot.position = Vector2(first_slot_pos_x + width_offset*x, first_slot_pos_y + hight_offset*y)
			var array_pos = str(x) + " / " + str(y)
			new_slot.show_slot_state(array_pos, str(array_number), slot_empty, slot_available_for_drop, slot_interactable)
			array_number+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
