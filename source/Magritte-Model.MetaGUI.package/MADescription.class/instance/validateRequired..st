validation-private
validateRequired: anObject
	"Validate ==anObject== not to be ==nil== if it is required."

	(self isRequired and: [ anObject isNil ])
		ifTrue: [ MARequiredError description: self signal: self requiredErrorMessage ]