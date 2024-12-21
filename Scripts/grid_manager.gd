extends Node2D
const CARD_SLOT_PATH = "res://Scenes/card_slot.tscn"
@export var columns: int = 3
@export var rows: int = 4
@export var width_offset: int = 150
@export var hight_offset: int = 200
var first_slot_pos_x
var first_slot_pos_y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_slot_pos_x = get_viewport().size.x/2 - width_offset * columns/2 + width_offset/2
	first_slot_pos_y = get_viewport().size.y/2 - hight_offset * rows/2
	var card_slot = preload(CARD_SLOT_PATH)
	for x in range(columns):
		for y in range(rows):
			var new_slot = card_slot.instantiate()
			add_child(new_slot)
			new_slot.position = Vector2(first_slot_pos_x + width_offset*x, first_slot_pos_y + hight_offset*y)
			print(new_slot.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
