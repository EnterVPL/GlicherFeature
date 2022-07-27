extends StaticBody2D

export(NodePath) var next_coin = null
export(NodePath) var unlock_tiles = null
export var been_change_map := false
export(String, FILE) var new_map

func coin_collected():
	if(been_change_map):
		get_tree().change_scene(new_map)
		return
	if(unlock_tiles == null):
		end_game()
		return
	if next_coin != null:
		var node_coin = get_node(next_coin)
		node_coin.visible = true
		
	var node_tile = get_node(unlock_tiles)
	node_tile.visible = true
	queue_free()

func end_game():
	get_tree().change_scene("res://src/maps/EndScreen.tscn")
