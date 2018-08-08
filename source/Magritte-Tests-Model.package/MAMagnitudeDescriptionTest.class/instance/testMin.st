tests-accessing
testMin
	self description min: self minInstance.
	self assert: self description min = self minInstance