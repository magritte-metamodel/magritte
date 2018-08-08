tests-actions
testReset
	self write: self includedInstance.
	self memento reset.
	self assert: self read = self includedInstance