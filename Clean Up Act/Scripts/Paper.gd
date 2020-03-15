extends "res://Scripts/TrashMover.gd"

#NOTHING HERE YET
#TODO: OVERWRITE hit_left / hit_right

#inherits from TrashMover, has access to all variables in TrashMover

func hit_left():
	print("Paper hit left GOOD")
	get_parent().get_node("Player").update_sentance(0,0,-5)
	velocity = Vector2(0, newSpeed).rotated(deg2rad(90))

func hit_right():
	print("Paper hit right BAD")
	get_parent().get_node("Player").update_sentance(0,-10,5)
	velocity = Vector2(0, newSpeed).rotated(deg2rad(240))
