evaluating
value: anObject
	^ conditions allSatisfy: [ :each | each value: anObject ]