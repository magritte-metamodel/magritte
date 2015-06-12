visiting-description
visitBooleanDescription: aDescription
	self stream nextPutAll: (self object
		ifTrue: [ aDescription trueString ]
		ifFalse: [ aDescription falseString ])