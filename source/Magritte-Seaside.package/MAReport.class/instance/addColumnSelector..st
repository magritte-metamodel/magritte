columns
addColumnSelector: aSelector
	^ (self addColumn: MAColumn new)
		selector: aSelector;
		yourself