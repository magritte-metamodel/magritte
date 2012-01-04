tests-actions
testReset
	self value: self defaultInstance.
	self write: self includedInstance.
	self assert: self memento hasChanged.

	self memento reset.
	self assert: self read = self defaultInstance.
	self assert: self value = self defaultInstance.
	self deny: self memento hasChanged