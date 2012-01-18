tests
testNilOrNotNil
	| object |
	object := [ 1 ] magritteDynamicObject.
	self deny: object isNil.
	self assert: object notNil.

	object := [ nil ] magritteDynamicObject.
	self assert: object isNil.
	self deny: object notNil