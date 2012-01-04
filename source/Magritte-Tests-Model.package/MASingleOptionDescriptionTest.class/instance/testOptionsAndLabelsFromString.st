tests
testOptionsAndLabelsFromString
	self description 
		undefined: 'void';
		optionsAndLabels: (Array with: 1 -> 'one' with: 2 -> 'two').

	self assert: (self description fromString: 'void') isNil.
	self assert: (self description fromString: 'one') = 1.
	self assert: (self description fromString: 'two') = 2