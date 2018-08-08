accessing
value
	^ super value ifNil: [ self value: Array new. super value ]