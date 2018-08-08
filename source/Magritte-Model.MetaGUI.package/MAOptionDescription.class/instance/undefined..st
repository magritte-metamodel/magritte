accessing-properties
undefined: aString
	super undefined: aString.
	self reference isNil
		ifFalse: [ self reference undefined: aString ]