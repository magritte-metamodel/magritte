testing
isWithinRange: anObject
	^ (self min isNil or: [ self min <= anObject ])
		and: [ self max isNil or: [ self max >= anObject ] ]