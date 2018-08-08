validating
validateRequired: anObject
	super validateRequired: anObject.
	(self isRequired and: [ anObject isCollection and: [ anObject isEmpty ] ])
		ifTrue: [ MARequiredError description: self signal: self requiredErrorMessage ]