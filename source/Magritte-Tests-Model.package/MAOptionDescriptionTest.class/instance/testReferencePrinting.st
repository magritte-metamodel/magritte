tests
testReferencePrinting
	| label |
	self description reference: MAStringDescription new.
	self assert: (self description labelForOption: 1) = '1'.
	label := self description labelForOption: 1 @ 2.
	self assert: (label includesSubstring: '1').
	self assert: (label includesSubstring: '2').
	label := self description labelForOption: 1 -> 2.
	self assert: (label includesSubstring: '1').
	self assert: (label includesSubstring: '2').