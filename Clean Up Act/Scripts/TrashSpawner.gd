extends Node2D

# Declare member variables here. Examples:

#holds references to the two different types of trashes
onready var trashes = [preload("res://Scenes/Paper.tscn"), preload("res://Scenes/Plastic.tscn")]

#holds references to timer variables. 
#dropTimer is the timer, dropRate how fast the timer gets called, dropSpeed is speed of trash falling
var dropTimer
var dropRate = 4
var dropSpeed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#sets random seed
	randomize()
	
	#sets up timer, connect tells timer what method to run on timeout, adds timer as a child
	dropTimer = Timer.new()
	dropTimer.connect("timeout",self,"_on_dropTimer_timeout") 
	add_child(dropTimer)
	
	#starts initial timer
	dropTimer.start(dropRate)
	

func _on_dropTimer_timeout():
	
	#leaving this to show how to do debug messages
	print("timered ", dropRate)
	
	#chooses a random trash to spawn, then drops it
	var nextTrash = trashes[randi()%2].instance()
	nextTrash.drop(global_position, deg2rad(0), dropSpeed)
	
	#so things can be referenced, they need to be a child of a node. This adds it to the main Node2D
	get_parent().add_child(nextTrash)
	
	#sets dropRate and dropSpeed for next timer pop
	dropRate = max(.5, dropRate - .1)
	dropSpeed += 1
	
	#sets timer to run again
	dropTimer.start(dropRate)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
