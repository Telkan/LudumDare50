extends Particles2D

onready var node_base = $"."
onready var num_player := 1

var node_player

func init(num_p):
	node_player = get_tree().get_root().find_node(str("Player",num_p),true,false)
	node_player.connect("jump_grounded",self,"particule_update")
	num_player = num_p

func particule_update():
	#print(str("Grounded P",num_player))
	#print(node_base.get_position()) # = node_player.position
	pass
	# reste au sol normalement
