private
printObjectDescribedBy: aDescription

	| string |
	string := aDescription displayStringFor: self object.
	self stream nextPutAll: string.