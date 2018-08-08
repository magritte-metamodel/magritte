tests-actions
testConflictReset
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanged.
	self deny: self memento hasConflict.

	self value: self otherInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanged.
	self assert: self memento hasConflict.

	self memento reset.
	self assert: self read = self otherInstance.
	self assert: self value = self otherInstance.
	self deny: self memento hasChanged.
	self deny: self memento hasConflict