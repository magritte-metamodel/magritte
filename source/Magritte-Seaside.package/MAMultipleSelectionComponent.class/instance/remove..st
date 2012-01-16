actions
remove: anObject
	self value: (self isDistinct
		ifTrue: [ self value copyWithout: anObject ]
		ifFalse: [ self value copyWithoutFirstOccurrenceOf: anObject ])