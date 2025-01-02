extends Node2D
const CARD_SLOT_PATH = "res://Scenes/card_slot.tscn"
const PLAYER_PATH = "res://Scenes/player.tscn"
const CARD_SCENE_PATH = "res://Scenes/card.tscn"
@export var columns: int = 3
@export var rows: int = 4
@export var width_offset: int = 150
@export var hight_offset: int = 200
var card_dic = { "fire": "res://Images/Cards/Test/fire_BG.png",
		"water": "res://Images/Cards/Test/water_BG.png",
		"earth": "res://Images/Cards/Test/earth_BG.png",
		"air": "res://Images/Cards/Test/air_BG.png"
}

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
var slots_on_grid = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func create_grid():
	first_slot_pos_x = get_viewport().size.x/2 - width_offset * columns/2 + width_offset/2
	first_slot_pos_y = get_viewport().size.y/2 - hight_offset * rows/2
	var card_slot = preload(CARD_SLOT_PATH)
	var player = preload(PLAYER_PATH)
	var array_number = 0
	for y in range(rows):
		for x in range(columns):
			#top slots interactable
			if y < 1 and x <= 3:
				slot_available_for_drop = true
			else:
				slot_available_for_drop = false
				
			if y > 1 and x <= 3:
				slot_interactable = true
			else:
				slot_interactable = false
				
			
			var new_slot = card_slot.instantiate()
			add_child(new_slot)
			new_slot.position = Vector2(first_slot_pos_x + width_offset*x, first_slot_pos_y + hight_offset*y)
			var array_pos = str(x) + " / " + str(y)
			new_slot.show_slot_state(array_pos, str(array_number), slot_empty, slot_available_for_drop, slot_interactable)
			array_number+=1
			slots_on_grid.append(new_slot)

func spawn_cards():
	var card_scene = preload(CARD_SCENE_PATH)
	for slot in slots_on_grid:
		if not slot["slot_available_for_drop"]:
			print (slot.position)
			
			var i = randi() % 4
			var path_to_card_BG: String = card_dic.values()[i]
			var name_card: String = card_dic.keys()[i]
			var new_card = card_scene.instantiate()
			$"../CardManager".add_child(new_card)
			new_card.name = "Card"
			new_card.set_values(i, name_card, load(path_to_card_BG)) #тут нужно разобраться чтобы загружать из внешней библиотеки
			new_card.position = slot.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_player_pos(player, position):
	player.position = position
