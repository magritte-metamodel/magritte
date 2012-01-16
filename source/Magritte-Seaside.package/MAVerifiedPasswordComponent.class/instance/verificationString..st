accessing
verificationString: aString
	| value |
	(self description isObfuscated: aString)
		ifTrue: [ ^ self ].
	value := [ self description fromString: aString ]
		on: Error do: [ :e | e return: aString ].
	self verificationValue: value