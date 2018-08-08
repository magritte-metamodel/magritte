visiting-description
visitTokenDescription: aDescription
	| token |
	self object: (aDescription kind streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			token := WriteStream on: String new.
			[ self stream atEnd or: [ aDescription separators includes: self stream peek ] ]
				whileFalse: [ token nextPut: self stream next ].
			self stream atEnd 
				ifFalse: [ self stream next ].
			token contents isEmpty
				ifFalse: [ output nextPut: (aDescription reference fromString: token contents) ] ] ])