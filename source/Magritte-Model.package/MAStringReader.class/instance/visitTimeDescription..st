visiting-description
visitTimeDescription: aDescription
	| string |
	string := self contents.
	(string notEmpty and: [ string allSatisfy: [ :each | '0123456789: apm' includes: each ] ])
		ifFalse: [ MAReadError signal ].
	self object: (aDescription kind readFrom: string readStream)