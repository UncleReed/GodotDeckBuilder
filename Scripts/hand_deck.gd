extends Node2D
@onready var CardScene: PackedScene = preload("res://Scenes/card.tscn")
@onready var SpawnPoint = $CanvasLayer/SpawnPoint
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var card: Card = CardScene.instantiate()
	SpawnPoint.add_child(card)
	card.set_values(3, "First")
	card.visible = true
