instance creation
receiver: anObject selector: aSelector arguments: anArray index: anInteger
	(aSelector numArgs = anArray size)
		ifFalse: [ self error: 'Invalid number of arguments.' ].
	(anInteger between: 0 and: anArray size)
		ifFalse: [ self error: 'Index out of bounds.' ].
	^ MAPluggableCondition new 
		initializeReceiver: anObject
		selector: aSelector
		arguments: anArray
		index: anInteger