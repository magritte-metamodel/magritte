actions
add: anObject
	(self isDistinct and: [ self value includes: anObject ])
		ifFalse: [ self value: (self value copyWith: anObject) ]