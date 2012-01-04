tests-actions
testCommit
	self write: self includedInstance.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance.

	self memento commit.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance