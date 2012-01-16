accessing-model
string
	^ self value isString
		ifTrue: [ self value ]
		ifFalse: [ self description toString: self value ]