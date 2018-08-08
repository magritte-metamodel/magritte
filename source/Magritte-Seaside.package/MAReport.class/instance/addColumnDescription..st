columns
addColumnDescription: aDescription
	^ self addColumn: (aDescription reportColumnClass new
		magritteDescription: aDescription;
		yourself)