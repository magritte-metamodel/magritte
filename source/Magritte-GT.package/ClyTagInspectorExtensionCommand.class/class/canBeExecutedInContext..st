testing
canBeExecutedInContext: aToolContext
	^ aToolContext selectedMethods allSatisfy: [ :e | e maIsDescription ]