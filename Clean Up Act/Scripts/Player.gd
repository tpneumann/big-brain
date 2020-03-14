extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var food = 100; 
var air = 100; 
var sentance = 80; 

#holds swipe timer stuff
var swipeActive
var swipeCooldown
var canSwipe = true
var sActive = .2
var sCooldown = .1

#holds reference to the swipe object
var swipe
var swipePosition
var swipeY = -64

#holds reference to swipe scenes
onready var hitLeft  = preload("res://Scenes/HitLeft.tscn")
onready var hitRight = preload("res://Scenes/HitRight.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#sets up timer for active frames
	swipeActive = Timer.new()
	swipeActive.connect("timeout",self,"_on_swipeActive_timeout") 
	add_child(swipeActive)
	swipeActive.one_shot = true
	
	#sets up timer for cooldown frames
	swipeCooldown = Timer.new()
	swipeCooldown.connect("timeout",self,"_on_swipeCooldown_timeout") 
	add_child(swipeCooldown)
	swipeCooldown.one_shot = true
	
	#sets position for swipe object
	swipePosition = Vector2(global_position.x, global_position.y + swipeY)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var object = get_parent().get_node(".")
	
	if canSwipe:
		if Input.is_action_just_pressed("ui_left"):
			make_swipe(hitLeft)
			
		if Input.is_action_just_pressed("ui_right"):
			make_swipe(hitRight)
			
	
	##if object.is_colliding():
		##update_sentance(-5, -5, 6);
		##pass
	
	##if player hit
		##remove food + air?

func make_swipe(hitDir):
	
	#create swipe collider
	swipe = hitDir.instance()
	add_child(swipe)
	swipe.global_position = swipePosition
	
	#prevent swiping until cooldown is done
	canSwipe = false;
	
	#starts active frames timer
	swipeActive.start(sActive)

func _on_swipeActive_timeout():
	
	#deletes swipe collider
	swipe.queue_free()
	remove_child(swipe)
	
	#starts cooldown frames timer
	swipeCooldown.start(sCooldown)

func _on_swipeCooldown_timeout():
	
	#allows for another swipe
	canSwipe = true

func update_sentance(cFood, cAir, cSentance):
	food = food + cFood
	air = air + cAir
	sentance = sentance + cSentance