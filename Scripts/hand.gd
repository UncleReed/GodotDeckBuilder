extends Node2D
const HAND_COUNT = 4
const CARD_SCENE_PATH = "res://Scenes/card.tscn"
const CARD_WIDTH = 150
const HAND_POS_Y = 900
var player_hand = []
var center_screen_x
@export var card_types: Resource


var card_dic = { "fire": "res://Images/Cards/Test/fire_BG.png",
		"water": "res://Images/Cards/Test/water_BG.png",
		"earth": "res://Images/Cards/Test/earth_BG.png",
		"air": "res://Images/Cards/Test/air_BG.png"
}
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_screen_x = get_viewport().size.x/2 
	var card_scene = preload(CARD_SCENE_PATH)
	for i in range(HAND_COUNT):
		var path_to_card_BG: String = card_dic.values()[i]
		var name_card: String = card_dic.keys()[i]
		var new_card = card_scene.instantiate()
		$"../CardManager".add_child(new_card)
		new_card.name = "Card"
		new_card.set_values(i, name_card, load(path_to_card_BG)) #тут нужно разобраться чтобы загружать из внешней библиотеки
		
		add_card_to_hand(new_card)
		
func add_card_to_hand(card):
	if card not in player_hand:
		player_hand.insert(0, card)
		update_hand_position()
	else:
		animate_card_to_position(card, card.starting_position)
	
func update_hand_position():
	for i in range(player_hand.size()):
		var new_position = Vector2(calculate_card_position(i), HAND_POS_Y)
		var card = player_hand[i]
		card.starting_position = new_position
		animate_card_to_position(card, new_position)
		
func calculate_card_position(index):
	var total_width = (player_hand.size()-1)*CARD_WIDTH
	var x_offset = center_screen_x + index*CARD_WIDTH - total_width/2
	return x_offset

func animate_card_to_position(card, new_position):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", new_position, 0.1)

func remove_card_from_hand(card):
	if card in player_hand:
		player_hand.erase(card)
		update_hand_position()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
