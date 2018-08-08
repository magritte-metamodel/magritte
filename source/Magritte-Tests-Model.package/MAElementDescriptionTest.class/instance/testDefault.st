tests-accessing
testDefault
	self description default: self includedInstance.
	self assert: self description default = self includedInstance