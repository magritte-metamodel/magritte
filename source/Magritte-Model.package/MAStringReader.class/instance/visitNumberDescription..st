visiting-description
visitNumberDescription: aDescription
	| isContentsValid |
	isContentsValid := NumberParser isValidNumber: self contents.
	isContentsValid ifFalse: [ MAReadError signal ].
	super visitNumberDescription: aDescription