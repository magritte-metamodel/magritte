visiting-description
visitColorDescription: aDescription
	(self contents notEmpty and: [ self contents allSatisfy: [ :each | '#0123456789ABCDEFabcdef.' includes: each ] ])
		ifFalse: [ MAReadError signal ].
	self object: (aDescription kind fromString: self contents)