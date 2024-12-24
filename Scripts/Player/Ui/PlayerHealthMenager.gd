extends Control

@export var health_label : PackedScene
@export var dmg_color : Color = Color.CRIMSON
@export var heal_color : Color = Color.LAWN_GREEN

func _ready():
	SignalHp.connect("on_health_changed",on_signal_health_changed)

func on_signal_health_changed(node : Node,hp_changed : int):
	var label_instance : Label = health_label.instantiate()
	node.add_child(label_instance)
	if hp_changed >= 0:
		label_instance.modulate = heal_color
	else:
		label_instance.modulate = dmg_color
	label_instance.text = str(hp_changed)
	
