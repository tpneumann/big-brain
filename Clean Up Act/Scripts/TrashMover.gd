extends KinematicBody2D

# Declare member variables here. Examples:

#creats a velocity variable to be referenced in drop and _process
var velocity = Vector2()
var speed = 0
var newSpeed = 2

#call when trash gets created, sets position to be created at, direction of sprite and speed
func drop(pos, dir, spd):
	
	global_position = pos
	rotation = dir
	speed = spd
	newSpeed *= speed
	velocity = Vector2(0, speed).rotated(rotation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#move_and_collide() moves the sprite and returns any collisions
	var collision = move_and_collide(velocity * delta)
	
	#if collision exists, then if the collision is with a Kinematic body
	if collision:
		if collision is KinematicCollision2D :
			
			#hold reference to collided colider, then check what we collided with. 
			#Then, run the appropriate method 
			var other = collision.collider
			if other.is_in_group("player"):
				hit_player(other)
			elif other.is_in_group("left_swipe"):
				hit_left()
				print("beep boop")
			elif other.is_in_group("right_swipe"):
				hit_right()

	
	#if trash is below the screen, delete it
	if global_position.y > 350:
		be_deleted();

#run deletion code for trash
#queue_free deletes it, remove_child removes it as a possible reference
func be_deleted():
	print("trash DELETED")
	self.queue_free()
	get_parent().remove_child(self)

#TODO: ADD CODE fOR WHAT HAPPENS IF WE FAIL TO HIT IT
func hit_player(player):
	player.update_sentance(0,0,10)
	be_deleted()

#Must be inherited by paper and plastic
func hit_left():
	pass

#Must be inherited by paper and plastic
func hit_right():
	pass