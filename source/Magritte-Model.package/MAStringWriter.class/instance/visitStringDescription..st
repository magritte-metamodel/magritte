visiting-description
visitStringDescription: aDescription

	| string |
	string := aDescription displayStringFor: self object.
	self stream nextPutAll: string.