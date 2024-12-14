class_name Card extends Node2D

@export var CardName: String = "CardName"
@export var CardCost: int = 1
@export var CardImage: Node2D

@onready var CostLabel: Label = $Cost/Label
@onready var NameLabel: Label = $CardName

func _ready():
	set_values(CardCost, CardName)
	visible = false
	
func  set_values(_cost: int, _name: String):
	CardName = _name
	CardCost = _cost
	CostLabel.set_text(str(_cost))
	NameLabel.set_text(_name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
