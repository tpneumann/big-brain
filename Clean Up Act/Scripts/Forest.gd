extends KinematicBody2D

# Declare member variables here. Examples:
onready var trees = [preload("res://Sprites/Forest1.png"),
preload("res://Sprites/Forest2.png"),
preload("res://Sprites/Forest3.png"),
preload("res://Sprites/Forest4.png"),
preload("res://Sprites/Forest5.png"),
preload("res://Sprites/Forest6.png"),
preload("res://Sprites/Forest7.png")]

onready var forest_sprite = get_node("ForestSprite")
var health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	forest_sprite.set_texture(trees[health])

func _process(delta):
	var collision = move_and_collide(Vector2(0,0))
	
	if collision:
		if collision is KinematicCollision2D :
			var other = collision.collider
			if other.is_in_group("Paper"):
				update_texture()
				other.be_deleted()


func update_texture(): 
	health += 1
	if health < 7:
		forest_sprite.set_texture(trees[min(health, 7)])
