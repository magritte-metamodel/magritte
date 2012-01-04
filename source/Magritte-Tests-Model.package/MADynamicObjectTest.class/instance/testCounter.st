tests
testCounter
	| object counter |
	counter := nil.
	object := [
		counter := counter isNil
			ifTrue: [ 1 ]
			ifFalse: [ counter := counter + 1 ] ]
		magritteDynamicObject.

	self assert: object = 1.
	self assert: object yourself = 2.
	self assert: object yourself yourself = 3