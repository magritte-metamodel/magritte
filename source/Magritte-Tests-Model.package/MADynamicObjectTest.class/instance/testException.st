tests
testException
	| object |
	object := [ 1 / 0 ] magritteDynamicObject.
	self 
		should: [ object greaseString ]
		raise: ZeroDivide.
	object := [ Halt signal ] magritteDynamicObject.
	self assert: object greaseString = 'nil'