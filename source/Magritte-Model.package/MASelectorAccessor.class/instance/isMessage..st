as yet unclassified
isMessage: aSelector
	^ self readSelector = aSelector or: [ self writeSelector = aSelector ]