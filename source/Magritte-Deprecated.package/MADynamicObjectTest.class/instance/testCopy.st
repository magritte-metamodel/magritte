tests
testCopy
	| object first second |
	object := [ Time millisecondClockValue ] magritteDynamicObject copy.
	first := object yourself.
	(Delay forMilliseconds: 2) wait.
	second := object yourself.

	self assert: first < second