extends KinematicBody2D

# Declare member variables here. Examples:
onready var fishes = [preload("res://Sprites/deadfish1.png"),
preload("res://Sprites/deadfish2.png"),
preload("res://Sprites/deadfish3.png"),
preload("res://Sprites/deadfish4.png"),
preload("res://Sprites/deadfish5.png"),
preload("res://Sprites/deadfish6.png"),
preload("res://Sprites/deadfish7.png")]

onready var ocean_sprite = get_node("OceanSprite")
var health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ocean_sprite.set_texture(fishes[health])

func _process(delta):
	var collision = move_and_collide(Vector2(0,0))
	
	if collision:
		if collision is KinematicCollision2D :
			var other = collision.collider
			if other.is_in_group("Plastic"):
				update_texture()
				other.be_deleted()

func update_texture(): 
	health += 1
	ocean_sprite.set_texture(fishes[min(health, 7)])
