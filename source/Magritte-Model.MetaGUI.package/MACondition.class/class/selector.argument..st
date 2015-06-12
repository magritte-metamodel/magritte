convenience
selector: aSelector argument: anObject
	^ self receiver: nil selector: aSelector arguments: (Array with: anObject) index: 0