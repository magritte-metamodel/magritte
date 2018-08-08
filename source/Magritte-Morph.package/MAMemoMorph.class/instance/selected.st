accessing
selected
	^ (self value ifNil: [ self magritteDescription default ]) ifNil: [ false ]