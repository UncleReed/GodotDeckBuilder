extends Node2D
@onready var CardScene: PackedScene = preload("res://Scenes/card.tscn")
@onready var SpawnPoint = $CanvasLayer/SpawnPoint

const COLLISION_MASK_CARD = 1
var screen_size
var card_dragged




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if card_dragged:
		var mouse_pos = get_global_mouse_position()
		card_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x), clamp(mouse_pos.y, 0, screen_size.y))

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			raycat_card()
			
			#var card = raycat_card()
			#if card:
				#card_dragged = card
		else:
			card_dragged = null

func raycat_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = 1
	var result = space_state.intersect_point(parameters)
	if result.size()>0:
		return result[0].collider.get_parent()
		print(1)
	return null

func _on_button_pressed() -> void:
	var card: Card = CardScene.instantiate()
	SpawnPoint.add_child(card)
	card.set_values(3, "First")
	card.visible = true
