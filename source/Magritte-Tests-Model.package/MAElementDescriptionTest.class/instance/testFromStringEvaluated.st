tests-strings
testFromStringEvaluated
	"This ensures that the parsing algorithm doesn't compile the input, what would cause a  security hole in the framework."

	| error |
	error := nil.
	self shouldSkipStringTests ifTrue: [ ^ self ].
	[ self description fromString: '1 / 0. nil' ]
		on: Exception 
		do: [ :err | error := err ].
	self deny: (error isKindOf: ZeroDivide)