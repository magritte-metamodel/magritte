visiting-description
visitNumberDescription: aDescription
	| isContentsValid |
	isContentsValid := NumberParser isNumber: self contents.
	isContentsValid ifFalse: [ MAReadError signal ].
	super visitNumberDescription: aDescription