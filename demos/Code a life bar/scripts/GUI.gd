extends MarginContainer

onready var Number = $Bars/LifeBar/Count/Background/Number
onready var Bar = $Bars/LifeBar/TextureProgress
onready var Tween = $Tween

var animated_health = 0
var health_to_display


func _ready():
	var player_max_health = $"../Characters/Player".max_health
	Bar.max_value = player_max_health
	update_health(player_max_health)


func _on_Player_took_damage(player_health):
	update_health(player_health)


func update_health(new_value):
	Tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not Tween.is_active():
		Tween.start()


func _process(delta):
	var round_value = round(animated_health)
	Number.text = str(round_value)
	Bar.value = round_value


func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	Tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
