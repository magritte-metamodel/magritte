columns
addColumnDescription: aDescription
	^ self addColumn: (aDescription reportColumnClass new
		description: aDescription;
		yourself)