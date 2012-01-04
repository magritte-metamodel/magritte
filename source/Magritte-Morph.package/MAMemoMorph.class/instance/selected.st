accessing
selected
	^ (self value ifNil: [ self description default ]) ifNil: [ false ]