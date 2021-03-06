extends Area

export var energy_recover := 1.5
export var boost_strength := 15.0
export var boost_duration := .75

onready var _visual := $visual as Spatial

func _ready() -> void:
	connect("body_entered", self, "_on_SpeedBoost_body_entered")


func _on_SpeedBoost_body_entered(body: Node) -> void:
	if not (body is Vehicle):
		return
	var vehicle := body as Vehicle
	vehicle.recover_energy(energy_recover)
	vehicle.add_boost(boost_strength, boost_duration)
	queue_free()


func _process(delta: float) -> void:
	_visual.rotate_y(deg2rad(60) * delta)
