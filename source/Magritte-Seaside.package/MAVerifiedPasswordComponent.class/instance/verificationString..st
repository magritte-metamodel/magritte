accessing
verificationString: aString
	| value |
	(self magritteDescription isObfuscated: aString)
		ifTrue: [ ^ self ].
	value := [ self magritteDescription fromString: aString ]
		on: Error do: [ :e | e return: aString ].
	self verificationValue: value