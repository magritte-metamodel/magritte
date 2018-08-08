validation-private
validateSpecific: anObject
	super validateSpecific: anObject.
	(self isWithinRange: anObject)
		ifFalse: [ MARangeError description: self signal: self rangeErrorMessage ]