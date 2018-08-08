tests-accessing
testMinMax
	self description min: self minInstance max: self maxInstance.
	self assert: self description min = self minInstance.
	self assert: self description max = self maxInstance