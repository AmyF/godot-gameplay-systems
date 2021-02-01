tool
extends GameplayEffect
class_name DamageGameplayEffect

export(String) var attribute_name
export(float) var damage_min = 0
export(float) var damage_max = 0


func _ready():
	activation_trigger = EffectActivationEvent.ImmediateActivation


func apply_effect() -> void:
	var parent = get_parent_attribute_map()
	
	if parent and parent.has("get_attribute"):
		var attribute: GameplayAttribute = parent.get_attribute(attribute_name)
		if attribute and attribute.name == attribute_name:
			attribute.current_value = clamp(-get_damage(), 0, attribute.max_value)


func get_damage() -> float:
	randomize()
	return (randf() * (damage_max - damage_min)) + damage_min
