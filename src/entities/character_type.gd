extends Resource
class_name CharacterType

enum Type {
	None,
	NetRunner,
	Dealer,
	Corporate,
	Fixer,
	Enhancer,
	Driver
}


export(Type) var type
export(String) var name
export(Texture) var texture = null
