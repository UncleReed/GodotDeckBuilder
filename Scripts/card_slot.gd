extends Node2D

var card_in_slot = false

func show_state(array_pos, array_number):
	$Array_Pos.text = array_pos
	$Array_Number.text = array_number
	
func show_card_info(name):
	$Card_Info.text = name
	
