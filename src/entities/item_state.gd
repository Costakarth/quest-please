extends Resource
class_name ItemState

enum ErrorType {
	BROKEN,
	WRONG_COLOR,
	WRONG_LABEL,
	WORN,
	WRONG_LOGO,
	WRONG_DRUG_COLOR,
	NOT_REJECTED
}

export(ErrorType) var error_type
export(Array, Texture) var texture_array
export(int) var difficulty = 0
