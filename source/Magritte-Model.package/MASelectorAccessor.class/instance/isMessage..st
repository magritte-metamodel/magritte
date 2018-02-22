testing
isMessage: aSelector
	^ self readSelector = aSelector or: [ self writeSelector = aSelector ]