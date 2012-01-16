actions
selectRow: anObject value: aBoolean
	aBoolean
		ifTrue: [ self selectRow: anObject ]
		ifFalse: [ self deselectRow: anObject ]