tests
testCalculated
	| object dummy |
	object := [ Time millisecondClockValue ] magritteDynamicObject.
	dummy := object yourself.

	(Delay forMilliseconds: 2) wait.
	self assert: dummy < object yourself