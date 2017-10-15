extends MarginContainer

onready var Number = $Bars/LifeBar/Count/Background/Number
onready var Bar = $Bars/LifeBar/TextureProgress
onready var Tween = $Tween

var animated_health = 0
var health_to_display


func _ready():
	var player_max_health = $"../Characters/Player".max_health
	Bar.max_value = player_max_health
	animated_health = player_max_health
	update_values(player_max_health)


func _on_Player_took_damage(player_health):
	update_values(player_health)


func update_values(new_value):
	Tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not Tween.is_active():
		Tween.start()
	set_process(true)


func _process(delta):
	var health_int = int(animated_health)
	Number.text = str(health_int)
	Bar.value = health_int


func _on_Tween_tween_completed( object, key ):
	set_process(false)


func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	Tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
