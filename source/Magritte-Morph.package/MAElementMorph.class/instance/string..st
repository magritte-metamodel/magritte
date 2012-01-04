accessing
string: aString
	| value |
	value := [ self description fromString: aString greaseString ]
		on: Error do: [ :e | aString ].
	self value: value; changed: #string