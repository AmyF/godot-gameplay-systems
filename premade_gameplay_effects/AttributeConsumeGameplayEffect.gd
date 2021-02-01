tool
extends TimedGameplayEffect
class_name AttributeConsumeGameplayEffect

export(String) var attribute_name = ""
export(float) var consume_per_second = 1 setget set_consume_per_second, get_consume_per_second


func _ready():
	activation_trigger = EffectActivationEvent.ImmediateActivation


func set_consume_per_second(value: float) -> void:
	consume_per_second = abs(value)


func get_consume_per_second() -> float:
	return consume_per_second


func apply_effect() -> void:
	var parent = get_parent_attribute_map()
	
	if parent and parent.has("get_attribute"):
		var attribute: GameplayAttribute = parent.get_attribute(attribute_name)
		if attribute and attribute.attribute_name == attribute_name:
			attribute.current_value = clamp(attribute.current_value - abs(consume_per_second), 0, attribute.max_value)
