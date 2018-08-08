tests-strings
testOptionsAndLabels
	self description reference: MANumberDescription new.
	self assert: (self description labelForOption: 1) = '1'.

	self description optionsAndLabels: (Array with: 1 -> 'one' with: 2 -> 'two').
	self assert: (self description labelForOption: 1) = 'one'.
	self assert: (self description labelForOption: 2) = 'two'.
	self assert: (self description labelForOption: 3) = '3'