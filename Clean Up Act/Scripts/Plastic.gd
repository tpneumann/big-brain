extends "res://Scripts/TrashMover.gd"

#NOTHING HERE YET
#TODO: OVERWRITE hit_left / hit_right

#inherits from TrashMover, should have access to all variables in TrashMover

func hit_left():
	print("Plastic hit left")
	velocity = Vector2(0, newSpeed).rotated(deg2rad(120))

func hit_right():
	print("Plastic hit right")
	velocity = Vector2(0, newSpeed).rotated(deg2rad(270))

func _process(delta):
	print("bigTest")