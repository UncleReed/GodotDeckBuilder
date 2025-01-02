extends Node2D
var player
var player_visible = false
var player_turn = false

const COLLISION_MASK_CARD_SLOT = 2 #???




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#create player
	player_turn = true
	var player_scene = preload("res://Scenes/player.tscn") 
	player = player_scene.instantiate()
	add_child(player)
	player.visible = player_visible

	$Label.visible = true
	await get_tree().create_timer(1.0).timeout
	$Label.visible = false
	
	
	$Grid.create_grid() #create grid
	$Grid.spawn_cards() #set cards for first 6 places (or from save for all grid)
	
	await get_tree().create_timer(1.0).timeout
	$Label.text = "chose start position"
	$Label.visible = true
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card_slot = raycat_card_slot()
			if card_slot and card_slot.slot_interactable and player_turn :
				set_player_pos(card_slot.position)
				
					

func set_player_pos(card_slot_pos):
	if player:
		player.position = card_slot_pos
		player_visible = true
		player.visible = player_visible
		$Label.visible = false
		player_turn = false
	
	#player.position = _card_slot_pos
	#print(_card_slot_pos)

		
	

func raycat_card_slot():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT #????
	var result = space_state.intersect_point(parameters)
	if result.size()>0:
		return result[0].collider.get_parent()
	return null
	
