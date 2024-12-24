extends Node2D

var card_in_slot = false
var slot_empty = true
var slot_available_for_drop = false
var slot_interactable = false
var BG_Alpha_notInteractable: float = 0.3
var BG_Alpha_Interactable: float = 0.7

func show_slot_state(array_pos, array_number, _slot_empty, _slot_available_for_drop, _slot_interactable):
	$Array_Pos.text = array_pos
	$Array_Number.text = array_number
	if slot_empty:
		$BG/ColorRect.visible = false
	else:
		$BG/ColorRect.visible = true
		
	if _slot_interactable:
		$BG.modulate = Color(1,1,1,BG_Alpha_Interactable)
	else:
		$BG.modulate = Color(1,1,1,BG_Alpha_notInteractable)
		
	slot_interactable = _slot_interactable
	
	
func show_card_info(name):
	$Card_Info.text = name

	
