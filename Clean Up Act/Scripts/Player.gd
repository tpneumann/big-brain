extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var food = 100; 
var air = 100; 
var sentance = 80; 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var object = get_parent().get_node(".")
	if Input.is_action_just_pressed("ui_left"):
		#move other object left
		object.position = Vector2(100, object.y)
		
			##if wrong, age ++ 
			##if right, age --
		pass
	if Input.is_action_just_pressed("ui_right"):
		#move other object right
		object.position = Vector2(1000, object.y)
			##if wrong, age ++
			##if right, age --
		pass
		
	##if object.is_colliding():
		##update_sentance(-5, -5, 6);
		##pass
	
	##if player hit
		##remove food + air?
func update_sentance(cFood, cAir, cSentance):
	food = food + cFood
	air = air + cAir
	sentance = sentance + cSentance