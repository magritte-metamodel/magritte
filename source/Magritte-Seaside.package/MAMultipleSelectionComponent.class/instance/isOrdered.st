testing
isOrdered
	^ self description isOrdered
		and: [ (self value respondsTo: #moveUp:)
		and: [ self value respondsTo: #moveDown: ] ]