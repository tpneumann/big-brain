extends Node2D

##PUT IN PLAYER
##signal food_changed;
##signal air_changed;
##signal sentance_changed; 

"""
func update_sentance(cFood, cAir, cSentance):
	food = food + cFood
	air = air + cAir
	sentance = sentance + cSentance
	emit_signal("food_changed", food);
	emit_signal("air_changed", air);
	emit_signal("sentance_changed", sentance);
"""

onready var food_bar = $MarginContainer/HBoxContainer/Food_Bar/Food
onready var air_bar = $MarginContainer/HBoxContainer/Air_Bar/Air
onready var sent_label = $MarginContainer/HBoxContainer/Sentance/sent_label
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_air_changed(air):
	update_air(air)

func _on_Player_food_changed(food):
    update_food(food);
	
func _on_Player_sentance_changed(sentance):
    update_sentance(sentance)

func update_air(new_val):
	air_bar.value = new_val
	
func update_food(new_val):
	food_bar.value = new_val

func update_sentance(new_val):
	sent_label.text = new_val