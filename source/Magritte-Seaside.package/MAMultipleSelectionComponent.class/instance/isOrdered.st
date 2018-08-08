testing
isOrdered
	^ self magritteDescription isOrdered
		and: [ (self value respondsTo: #moveUp:)
		and: [ self value respondsTo: #moveDown: ] ]