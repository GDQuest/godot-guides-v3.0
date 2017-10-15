extends Node2D

signal took_damage
signal died

export var max_health = 18
var health = max_health

# When the character dies, we fade the UI
enum STATES {ALIVE, DEAD}
var state = ALIVE

# Implement stamina as an exercise + solution!
#var max_energy = 18
#var energy = max_energy

func _ready():
	# Connect to the life and stamina bars
	emit_signal("tree_entered", max_health)

func take_damage(count):
	if state == DEAD:
		return

	health -= count
	if health < 0:
		health = 0
		state = DEAD
		emit_signal("died")

	$AnimationPlayer.play("take_hit")
	emit_signal("took_damage", health)

func _on_AnimationPlayer_animation_finished( name ):
	if state != DEAD:
		return
	if name != "take_hit":
		return

	$AnimationPlayer.play("die")
