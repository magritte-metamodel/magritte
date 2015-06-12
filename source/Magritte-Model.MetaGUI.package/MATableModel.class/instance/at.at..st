accessing
at: aRowIndex at: aColumnIndex
	"Answer the contents of ==aRowIndex== and ==aColumnIndex==. Raises an error if the coordinates are out of bounds."

	self checkAt: aRowIndex at: aColumnIndex.
	^ self uncheckedAt: aRowIndex at: aColumnIndex