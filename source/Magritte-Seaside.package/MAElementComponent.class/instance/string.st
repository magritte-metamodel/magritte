accessing-model
string
	^ self value isString
		ifTrue: [ self value ]
		ifFalse: [ self magritteDescription toString: self value ]