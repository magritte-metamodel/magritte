tests
testCollection
	| object |
	object := [ OrderedCollection with: 1 with: 2 ] magritteDynamicObject.
	self assert: object size = 2.
	self assert: object first = 1.
	self assert: object second = 2.

	object add: 3.
	self assert: object size = 2.
	self assert: object first = 1.
	self assert: object second = 2