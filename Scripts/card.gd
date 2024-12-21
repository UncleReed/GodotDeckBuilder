class_name Card extends Node2D

@export var CardName: String = "CardName"
@export var CardCost: int = 1
@export var BG = preload("res://Images/Cards/Test/water_BG.png")

@onready var CostLabel: Label = $Cost/Label
@onready var NameLabel: Label = $CardName
@onready var BG_Image: Sprite2D = $BG_Image

signal hovered
signal hovered_off

var starting_position 

func _ready():
	#All cards must be a child of card_manager
	get_parent().connect_card_signals(self)
	
	
	set_values(CardCost, CardName, BG)
	#visible = false
	
func  set_values(_cost: int, _name: String, _BG):
	CardName = _name
	CardCost = _cost
	BG = _BG
	CostLabel.set_text(str(_cost))
	NameLabel.set_text(_name)
	BG_Image.texture = _BG
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
