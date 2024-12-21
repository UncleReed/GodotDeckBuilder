extends GridContainer
const CARD_SLOT_CONTAINER_PATH = "res://Scenes/card_slot_container.tscn"
#columns and slots for grid container
@export var num_columns: int = 4
@export var num_slots: int = 12

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var card_slot = preload(CARD_SLOT_CONTAINER_PATH)
	columns = num_columns
	for i in range(num_slots):
		var new_slot = card_slot.instantiate()
		add_child(new_slot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
