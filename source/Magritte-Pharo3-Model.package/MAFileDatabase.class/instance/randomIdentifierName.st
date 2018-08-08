private
randomIdentifierName

	| digits idLength allowedCharacters |
	digits := $0 to: $9.
	allowedCharacters := digits, Character alphabet.
	idLength := 30.
	^ String streamContents: [ :str |
		idLength timesRepeat: [ str nextPut: allowedCharacters atRandom ] ].