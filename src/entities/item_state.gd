extends Resource
class_name ItemState

enum ErrorType {
	BROKEN,
	COLOR,
	STRING,
	WORN,
	LOGO,
	DRUG_COLOR,
	NOT_REJECTED
}

export(ErrorType) var error_type
export(Array, Texture) var texture_array
export(int) var difficulty = 0
