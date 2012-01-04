tests
testConstant
	| object |
	object := [ self ] magritteDynamicObject.
	self assert: object = self.

	object := [ 123 ] magritteDynamicObject.
	self assert: object = 123