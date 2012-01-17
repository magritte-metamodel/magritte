accessing
string: aString
	| value |
	value := [ self magritteDescription fromString: aString greaseString ]
		on: Error do: [ :e | aString ].
	self value: value; changed: #string