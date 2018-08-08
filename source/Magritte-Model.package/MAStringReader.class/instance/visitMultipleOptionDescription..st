visiting-description
visitMultipleOptionDescription: aDescription
	self object: (Array streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			output nextPut: (aDescription reference
				fromString: (self stream upTo: $,)).
			self stream peek = Character space
				ifTrue: [ self stream next ] ] ])