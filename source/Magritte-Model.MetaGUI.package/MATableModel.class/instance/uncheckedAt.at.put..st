accessing
uncheckedAt: aRowIndex at: aColumnIndex put: aValue
	^ self contents at: (self indexAt: aRowIndex at: aColumnIndex) put: aValue