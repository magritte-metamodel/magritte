columns
addColumnCascade: anArray
	^ (self addColumn: MAColumn new)
		accessor: anArray;
		yourself