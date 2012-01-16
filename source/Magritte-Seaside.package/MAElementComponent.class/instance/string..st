accessing-model
string: aString
	| value |
	value := [ self description fromString: aString ]
		on: Error do: [ :e | e return: aString ].
	self value: value