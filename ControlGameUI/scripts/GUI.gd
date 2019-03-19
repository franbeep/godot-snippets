extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween

var animated_health = 0

func _ready():
    var player_max_health = $"../Characters/Player".max_health
    bar.max_value = player_max_health
    number_label.text = str($"../Characters/Player".health)
    animated_health = $"../Characters/Player".health


func _on_Player_health_changed(player_health):
    update_health(player_health)

func update_health(health):
    tween.interpolate_property(self, "animated_health", animated_health, health, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
    if not tween.is_active():
        tween.start()

func _process(delta):
    var round_value = round(animated_health)
    number_label.text = str(round_value)
    bar.value = round_value
