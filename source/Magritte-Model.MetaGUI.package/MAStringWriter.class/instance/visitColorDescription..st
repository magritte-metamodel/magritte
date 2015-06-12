visiting-description
visitColorDescription: aDescription
	stream nextPut: $#.
	stream nextPutAll: ((255 * self object red) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object green) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object blue) asInteger
		printPaddedWith: $0 to: 2 base: 16)