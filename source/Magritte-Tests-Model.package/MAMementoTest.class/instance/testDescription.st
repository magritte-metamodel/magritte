tests-accessing
testDescription
	self assert: self memento magritteDescription = self magritteDescription.
	self assert: self memento magritteDescription = self descriptionInstance