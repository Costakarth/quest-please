extends Resource
class_name Item

export(String) var name
export(String, MULTILINE) var description
export(Texture) var texture = null
export(Texture) var texture_detailed = null
export(Array, Resource) var item_states

func get_item_states(level : int) -> Array:
	var new_item_states = []
	for state in item_states:
		if state.difficulty <= level:
			new_item_states.append(state)
	return new_item_states
	
func get_random_item_state_from_level(level : int) -> ItemState:
	var states : Array = get_item_states(level)
	return states[Randomizer.get_random_integer(states.size())]
	
func get_item_states_from_level_to_level(to_level : int, from_level : int) -> Array:
	var new_item_states = []
	for state in item_states:
		if state.difficulty <= to_level && state.difficulty >= from_level:
			new_item_states.append(state)
	return new_item_states
	
func get_random_item_state_from_level_to_level(to_level : int, from_level : int) -> ItemState:
	var states : Array = get_item_states_from_level_to_level(to_level, from_level)
	return states[Randomizer.get_random_integer(states.size())]
