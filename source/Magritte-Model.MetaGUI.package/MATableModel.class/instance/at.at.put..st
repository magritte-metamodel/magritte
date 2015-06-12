accessing
at: aRowIndex at: aColumnIndex put: aValue
	"Set the contents of ==aRowIndex== and ==aColumnIndex==> to ==aValue==. Raises an error if the coordinates are out of bounds."

	self checkAt: aRowIndex at: aColumnIndex.
	^ self uncheckedAt: aRowIndex at: aColumnIndex put: aValue